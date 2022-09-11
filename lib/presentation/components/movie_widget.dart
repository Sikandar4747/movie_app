import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_text_styles.dart';

class MovieWidget extends StatelessWidget {
  final String? imagePath;
  final String? movieName;
  const MovieWidget({Key? key, this.imagePath, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imagePath!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: 70,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 27),
        child: Text(
          movieName!,
          style: AppTextStyle.kEighteenWithWhiteColor500,
        ),
      ),
    );
  }
}
