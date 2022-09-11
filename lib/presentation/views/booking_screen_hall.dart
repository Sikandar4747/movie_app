import 'package:flutter/material.dart';
import 'package:tentwenty/constants/app_text_styles.dart';
import 'package:tentwenty/constants/colors_constants.dart';

import 'booking_screen.dart';
import 'details_screen.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({Key? key}) : super(key: key);

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  String selectedDate = '';
  String selectedContainer = '';
  List<String> dateList = [
    '11 Sept',
    '12 Sept',
    '13 Sept',
    '14 Sept',
    '15 Sept',
  ];

  List<String> timeList = [
    '12:30',
    '13:30',
  ];

  List<String> priceList = [
    '50\$ ',
    '75\$ ',
  ];
  List<String> bonusList = [
    '2500',
    '3000',
  ];
  @override
  void initState() {
    selectedDate = dateList[0];
    selectedContainer = priceList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              "Date",
              style: AppTextStyle.kSixteenWithBlueColor500,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DateWidget(
                      date: dateList[index],
                      color: selectedDate == dateList[index]
                          ? AppColors.appBarSubTitleTextColor
                          : Colors.grey.withOpacity(0.2),
                      textColor: selectedDate == dateList[index]
                          ? AppTextStyle.kTwelveWithWhiteColor600
                          : AppTextStyle.kTwelveWithBlackColor600,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: dateList.length),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 210,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HallWidget(
                      time: timeList[index],
                      price: priceList[index],
                      bonus: bonusList[index],
                      color: selectedContainer == priceList[index]
                          ? AppColors.appBarSubTitleTextColor
                          : AppColors.unselectedContainerGreyColor,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemCount: timeList.length),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: CustomButton(
                btnTxt: "Select Seats",
                borderRadius: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const BookingScreen(),
                    ),
                  );
                },
                backgroundColor: AppColors.appBarSubTitleTextColor,
                width: 230,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String date;
  final Color color;
  final TextStyle textColor;

  const DateWidget({
    required this.date,
    required this.color,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: Text(date, style: textColor),
    );
  }
}

class HallWidget extends StatelessWidget {
  final String time;
  final String price;
  final String bonus;
  final Color color;

  const HallWidget({
    required this.time,
    required this.price,
    required this.bonus,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              time,
              style: AppTextStyle.kSixteenWithBlueColor500,
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              "Cinetech + hall 1",
              style: AppTextStyle.kTwelveWithGreyColor400,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 145,
          width: 250,
          decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: AssetImage("assets/images/hall_seats.png"))),
        ),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(text: "From ", style: AppTextStyle.kTwelveWithGreyColor400, children: [
            TextSpan(text: price, style: AppTextStyle.kTwelveWithDarkBlueColor700),
            TextSpan(text: "or ", style: AppTextStyle.kTwelveWithGreyColor400),
            TextSpan(text: "$bonus bonus", style: AppTextStyle.kTwelveWithDarkBlueColor700),
          ]),
        ),
      ],
    );
  }
}
