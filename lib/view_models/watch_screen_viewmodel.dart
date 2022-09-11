import 'package:flutter/cupertino.dart';
import 'package:tentwenty/constants/api_contants.dart';

import '../data/dio_client.dart';
import '../models/movies_model.dart';
import '../utils/enums.dart';

class WatchScreenViewModel extends ChangeNotifier {
  bool _loading = false;
  View _view = View.inTheatre;
  View get view => _view;
  bool get loading => _loading;
  List<MoviesModel> _inTheatreMovies = [];
  List<MoviesModel> get inTheatreMovies => _inTheatreMovies;
  List<MoviesModel> _searchedMovies = [];
  List<MoviesModel> get searchedMovies => _searchedMovies;
  void toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  void toggleSearch(View view) {
    if (view == _view) {
      return;
    }
    _view = view;
    notifyListeners();
  }

  void fetchMovies() async {
    toggleLoading();
    try {
      var response = await DioClient.instance.get(APIConstants.inTheatreMovies);

      if (response.data['errorMessage'].toString().isEmpty) {
        _inTheatreMovies.clear();
        response.data['items'].forEach((e) {
          _inTheatreMovies.add(MoviesModel.fromJson(e));
        });
        notifyListeners();
      }
      toggleLoading();
    } catch (e) {
      toggleLoading();
    }
  }

  void searchMovies(String value) async {
    if (value.isEmpty) {
      toggleSearch(View.searchOpen);
      return;
    } else {
      toggleSearch(View.searching);
    }
    try {
      var response = await DioClient.instance.get(APIConstants.searchMovie + value);
      print('response is ${response.data.toString()}');
      if (response.data['errorMessage'].toString().isEmpty) {
        _searchedMovies.clear();
        response.data['results'].forEach((e) {
          _searchedMovies.add(MoviesModel.fromJson(e));
        });
        notifyListeners();
      }
    } catch (e) {}
  }

  voidSearchMovies() {}
}
