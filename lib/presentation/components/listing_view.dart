import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/presentation/components/seach_movie_widget.dart';

import '../../utils/enums.dart';
import '../../view_models/watch_screen_viewmodel.dart';
import '../views/details_screen.dart';
import 'category_list.dart';
import 'movie_widget.dart';

class ListingView extends StatelessWidget {
  const ListingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchScreenViewModel>(
      builder: (_, watchScreenViewModel, __) {
        return watchScreenViewModel.loading
            ? const Center(child: CircularProgressIndicator())
            : watchScreenViewModel.view == View.searchOpen
                ? const CategoriesList()
                : watchScreenViewModel.view == View.searching
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MovieDetailsScreen(
                                          movieDetails: watchScreenViewModel.searchedMovies[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: SearchMovieWidget(
                                    imagePath:
                                        watchScreenViewModel.searchedMovies[index].image ?? '',
                                    movieName:
                                        watchScreenViewModel.searchedMovies[index].title ?? '',
                                    genre: 'Fantasy',
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: watchScreenViewModel.searchedMovies.length,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => MovieDetailsScreen(
                                          movieDetails: watchScreenViewModel.inTheatreMovies[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: MovieWidget(
                                    imagePath:
                                        watchScreenViewModel.inTheatreMovies[index].image ?? '',
                                    movieName:
                                        watchScreenViewModel.inTheatreMovies[index].title ?? '',
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: watchScreenViewModel.inTheatreMovies.length,
                            ),
                          ),
                        ],
                      );
      },
    );
  }
}
