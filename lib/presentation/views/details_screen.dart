import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty/models/movies_model.dart';
import 'package:tentwenty/presentation/views/trailer_screen.dart';

import '../../constants/app_text_styles.dart';
import '../../constants/colors_constants.dart';
import 'booking_screen_hall.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.movieDetails}) : super(key: key);
  final MoviesModel movieDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: AppColors.bottomNavBarBgColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      image: CachedNetworkImageProvider(
                        movieDetails.image!,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text('Watch',
                            style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('In Theaters December 22, 2021',
                        style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(
                          fontSize: 15,
                        )),
                  ),
                ),
                Positioned(
                    bottom: 90,
                    child: CustomButton(
                      width: 230,
                      borderRadius: 10,
                      fontsizebtn: 16,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const SeatScreen(),
                          ),
                        );
                      },
                      btnTxt: 'Get Tickets',
                      backgroundColor: AppColors.appBarSubTitleTextColor,
                    )),
                Positioned(
                  bottom: 30,
                  child: CustomButton(
                    width: 230,
                    borderRadius: 10,
                    fontsizebtn: 16,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => VideoApp(),
                        ),
                      );
                    },
                    btnTxt: 'Watch Trailer',
                    backgroundColor: Colors.transparent,
                    isLeftIcon: true,
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40.0, bottom: 10),
            child: Text(
              'Genres',
              style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 28,
            child: ListView.builder(
              itemCount: movieDetails.genreList?.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 40.0),
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getRandomGenreColor(),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    movieDetails.genreList![index].value ?? '',
                    style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(fontSize: 14),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 40.0, bottom: 10),
            child: Text(
              'Overview',
              style: AppTextStyle.kEighteenWithWhiteColor500.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 30),
              child: Text(
                movieDetails.plot ?? '',
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomGenreColor() {
    Random random = Random();
    int num = random.nextInt(3);
    if (num == 0) {
      return AppColors.genre1;
    } else if (num == 1) {
      return AppColors.genre2;
    } else if (num == 2) {
      return AppColors.genre3;
    } else {
      return AppColors.vipSeatColor;
    }
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? btnTxt;
  final Color? backgroundColor;
  final Color? textColor;
  final bool setValue;
  final Size? size;
  final double? fontsizebtn;
  final bool? defaultBtnText;
  final bool? isIcon;
  final bool? isLeftIcon;
  final Widget? icon;
  final double borderRadius;
  final double border;
  final double width;

  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.width,
      required this.btnTxt,
      this.borderRadius = 10,
      this.border = 0,
      this.setValue = false,
      this.size,
      this.backgroundColor,
      this.textColor,
      this.fontsizebtn = 20,
      this.isIcon = false,
      this.isLeftIcon = false,
      this.icon,
      this.defaultBtnText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.appBarTextColor,
      minimumSize: setValue == true ? size : Size(MediaQuery.of(context).size.width, 50),
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(),
    );

    return Container(
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: border,
          color: AppColors.appBarSubTitleTextColor,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: flatButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLeftIcon! ? icon! : const SizedBox(),
            isLeftIcon!
                ? const SizedBox(
                    width: 5,
                  )
                : const SizedBox(),
            Text(
              btnTxt ?? "",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: defaultBtnText == true ? textColor : Colors.white, fontSize: fontsizebtn),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 5,
            ),
            isIcon! ? icon! : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
