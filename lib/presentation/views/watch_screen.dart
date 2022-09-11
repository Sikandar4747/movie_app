import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/constants/app_text_styles.dart';
import 'package:tentwenty/constants/colors_constants.dart';
import 'package:tentwenty/view_models/watch_screen_viewmodel.dart';

import '../../utils/enums.dart';
import '../components/bottom_navigation.dart';
import '../components/listing_view.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  TextEditingController searchController = TextEditingController();
  late WatchScreenViewModel moviesProvider;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    moviesProvider = Provider.of<WatchScreenViewModel>(
      context,
      listen: false,
    );
    Future.delayed(
      Duration.zero,
      () {
        moviesProvider.fetchMovies();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          60,
        ),
        child: Selector<WatchScreenViewModel, View>(selector: (context, watchScreenViewModel) {
          return watchScreenViewModel.view;
        }, builder: (context, view, _) {
          return AppBar(
            title: view == View.inTheatre
                ? Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Watch",
                          style: AppTextStyle.kSixteenWithBlueColor500,
                        ),
                        GestureDetector(
                          onTap: () {
                            moviesProvider.toggleSearch(View.searchOpen);
                          },
                          child: const Icon(Icons.search),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldBgColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: moviesProvider.searchMovies,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.only(top: 15),
                          border: InputBorder.none,
                          hintText: "TV shows, movies and more",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.appBarTextColor,
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                moviesProvider.toggleSearch(View.inTheatre);
                                searchController.clear();
                              },
                              child: const Icon(
                                Icons.close,
                                color: AppColors.appBarTextColor,
                              )),
                        ),
                      ),
                    ),
                  ),
            elevation: 0,
          );
        }),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListingView(),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
