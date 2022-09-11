import 'package:flutter/material.dart';
import 'package:tentwenty/constants/colors_constants.dart';

class AppTextStyle {
  static var kTenWithGreyColor700 =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.appGreyColor);

  static var kTenWithWhiteColor700 =
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white);

  static var kTwelveWithGreyColor400 =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.appGreyColor);
  static var kTwelveWithBlueColor500 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.appBarSubTitleTextColor);

  static var kTwelveWithWhiteColor600 =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white);

  static var kTwelveWithBlackColor600 =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black);

  static var kTwelveWithDarkBlueColor700 =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.appBarTextColor);

  static var kSixteenWithBlueColor500 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static var kEighteenWithWhiteColor500 =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
}
