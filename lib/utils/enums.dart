import 'package:flutter/material.dart';
import 'package:tentwenty/constants/colors_constants.dart';

enum SeatingPLan {
  booked(AppColors.appBarSubTitleTextColor),
  available(Colors.grey),
  hidden(Colors.transparent),
  selected(AppColors.genre3),
  vip(AppColors.vipSeatColor),
  number(AppColors.bottomNavBarBgColor);

  final Color color;
  const SeatingPLan(this.color);
}

enum View {
  inTheatre,
  searchOpen,
  searching,
}
