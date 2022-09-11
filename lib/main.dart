import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/constants/colors_constants.dart';
import 'package:tentwenty/presentation/views/watch_screen.dart';
import 'package:tentwenty/view_models/watch_screen_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (BuildContext context) => WatchScreenViewModel(),
      child: MaterialApp(
        title: 'Test App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.appBarBgColor,
              titleTextStyle: TextStyle(color: AppColors.appBarTextColor),
              iconTheme: IconThemeData(color: AppColors.appBarTextColor)),
          scaffoldBackgroundColor: AppColors.scaffoldBgColor,
        ),
        home: const WatchScreen(),
      ),
    );
  }
}
