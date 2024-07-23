import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/home_ui/cricket_home_screen.dart';
import 'package:touch_down/widgets/home_widgets/aimated_container.dart';
import 'package:touch_down/widgets/home_widgets/drawer_content.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final HomeController controller= Get.put(HomeController(),tag: 'HomeController');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: kDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image slider
          Container(
            height: mQ.height / 3,
            width: mQ.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentIndex.value = index;
                    },
                    itemCount: controller.carouselPictures.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        controller.carouselPictures[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  KAnimatedContainer(),
                  Positioned(
                    bottom: 10.0,
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.carouselPictures.length,
                      effect: const WormEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        activeDotColor: AppColor.primaryColor, // Change to your active color
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Sports', style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400)),
                  2.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GameContainer(
                          onTap: (){
                            Get.to(()=> CricketHomeScreen());
                          },
                          iconPath: ImgUtils.greenCricketImg, sportName: 'Cricket'),
                      GameContainer(onTap: (){}, iconPath: ImgUtils.basketBallImg, sportName: 'Football'),
                      GameContainer(onTap: (){}, iconPath: ImgUtils.greenBadmintonImg, sportName: 'Badminton'),
                      GameContainer(onTap: (){}, iconPath: ImgUtils.volleyBalImg, sportName: 'Table Tennis'),
                    ],
                  ),
                  2.height,
                  Text('Recent News Updates', style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400)),
                  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return newsContainer(
                        updateName: 'News Update ${index + 1}',
                        newsDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      );
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 2.h,vertical: 1.h),
            ),
          ),
        ],
      ),
    );
  }
}
