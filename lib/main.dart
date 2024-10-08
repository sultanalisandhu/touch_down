import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/services/dependency_injection_services.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/view/auth/splash_screen.dart';

//@android:style/Theme.Light.NoTitleBar in styles.xml

void main()async {

  DependencyInjection.init();
  runApp(DevicePreview(
      enabled: false,
      builder: (BuildContext context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context,orientation,deviceType){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Touch Down',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.whiteColor,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
              useMaterial3: true,
            ),
            home:  SplashScreen(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
          );
        });
  }
}
