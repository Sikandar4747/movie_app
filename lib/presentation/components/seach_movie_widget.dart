import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_text_styles.dart';
import '../../constants/colors_constants.dart';

class SearchMovieWidget extends StatelessWidget {
  final String? imagePath;
  final String? movieName;
  final String? genre;
  const SearchMovieWidget({
    Key? key,
    this.imagePath,
    this.movieName,
    this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 139,
          padding: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                imagePath ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieName ?? 'N/A',
                style: AppTextStyle.kSixteenWithBlueColor500,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(genre ?? 'N/A',
                  style: AppTextStyle.kTwelveWithBlueColor500.copyWith(
                    color: AppColors.searchGenreColor,
                  )),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/images/icons8-dots-loading-24.png',
          color: Colors.blue,
        ),
      ],
    );
  }
}
