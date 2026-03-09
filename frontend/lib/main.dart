import 'package:ElectraGo/Controller/language_controller.dart';
import 'package:ElectraGo/Controller/provider_cart.dart';
import 'package:ElectraGo/View/Intro%20Screen/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartController(),
      child: ScreenUtilInit(
        designSize: const Size(385, 725),
        child: GetMaterialApp(
            locale: const Locale('Eng'),
            fallbackLocale: const Locale('Eng'),
            translations: Language(),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            theme: ThemeData(
                useMaterial3: true,
                fontFamily: 'CustomFont',
                scaffoldBackgroundColor: Colors.white)),
      ),
    ),
  );
}
