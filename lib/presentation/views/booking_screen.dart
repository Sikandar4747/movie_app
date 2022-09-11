import 'package:flutter/material.dart';
import 'package:tentwenty/constants/colors_constants.dart';

import '../../constants/app_text_styles.dart';
import '../../data/dummy_data.dart';
import '../../utils/enums.dart';
import 'details_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    int row = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The King's Man",
              style: AppTextStyle.kSixteenWithBlueColor500,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "In theaters december 22, 2021",
              style: AppTextStyle.kTwelveWithBlueColor500,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/Ellipse 36 (1).png',
                    fit: BoxFit.fitWidth,
                  ),
                  Text(
                    'Screen',
                    style: AppTextStyle.kTwelveWithBlueColor500,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InteractiveViewer(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 22,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        if (seats[index] == SeatingPLan.number) {
                          row++;
                        }
                        return seats[index] == SeatingPLan.number
                            ? Text(
                                row.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              )
                            : Image.asset(
                                'assets/images/Seat.png',
                                color: seats[index].color,
                                fit: BoxFit.fitWidth,
                              );
                      },
                      itemCount: 220,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.appBarBgColor,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.appBarBgColor,
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.dividerColor,
                    ),
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: 10,
                    ),
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            color: AppColors.appBarBgColor,
            padding: const EdgeInsets.all(
              20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Seat.png',
                            height: 25,
                            fit: BoxFit.fitHeight,
                            color: AppColors.genre3,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Selected',
                            style: AppTextStyle.kTwelveWithGreyColor400,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Seat.png',
                            height: 25,
                            fit: BoxFit.fitHeight,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Not Available',
                            style: AppTextStyle.kTwelveWithGreyColor400,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Seat.png',
                            height: 25,
                            fit: BoxFit.fitHeight,
                            color: AppColors.vipSeatColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'VIP (' '\$150)',
                            style: AppTextStyle.kTwelveWithGreyColor400,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/Seat.png',
                            height: 25,
                            fit: BoxFit.fitHeight,
                            color: AppColors.appBarSubTitleTextColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Regular (' '\$50)',
                            style: AppTextStyle.kTwelveWithGreyColor400,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 35,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "4/",
                            style: AppTextStyle.kTwelveWithGreyColor400.copyWith(fontSize: 16),
                            children: [
                              TextSpan(
                                text: '3',
                                style: AppTextStyle.kTwelveWithGreyColor400,
                              ),
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.cancel_outlined)
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      height: 51,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Total Price',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '50' '\$',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        btnTxt: "Proceed to pay",
                        borderRadius: 10,
                        fontsizebtn: 14,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const BookingScreen(),
                            ),
                          );
                        },
                        backgroundColor: AppColors.appBarSubTitleTextColor,
                        width: 0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
