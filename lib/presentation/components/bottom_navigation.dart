import 'package:flutter/material.dart';

import '../../constants/app_text_styles.dart';
import '../../constants/colors_constants.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.bottomNavBarBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27),
          topRight: Radius.circular(27),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bottomIcon1.png"),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Dashboard",
                style: AppTextStyle.kTenWithGreyColor700,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bottomIcon2.png"),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Watch",
                style: AppTextStyle.kTenWithWhiteColor700,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bottomIcon3.png"),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Media Library",
                style: AppTextStyle.kTenWithGreyColor700,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bottomIcon.png"),
              const SizedBox(
                height: 5,
              ),
              Text(
                "More",
                style: AppTextStyle.kTenWithGreyColor700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
