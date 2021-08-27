import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/apiConstants.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/constants/pageId.dart';
import 'package:netflix_clone/constants/typeConstant.dart';
import 'package:netflix_clone/controllers/SearchController.dart';
import 'package:netflix_clone/controllers/homeController.dart';
import 'package:netflix_clone/widgets/bottomNavBar.dart';
import 'package:netflix_clone/widgets/bottomNavBarItem.dart';
import 'package:netflix_clone/widgets/homeScreenBuilder.dart';
import 'package:netflix_clone/widgets/imageList.dart';
import 'package:netflix_clone/widgets/imageSwiper.dart';
import 'package:netflix_clone/widgets/searchScreenBuilder.dart';
import 'package:netflix_clone/widgets/topToolBarButton.dart';
import 'package:netflix_clone/widgets/topToolBarHolder.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: kBackgroundCOlor,
      body: Stack(
        children: [
          GetBuilder<HomeController>(
            builder: (_) {
              if (controller.inHomeScreen)
                return HomeScreenBuilder(size: size, controller: controller);
              else
                return SearchScreenBuilder(size: size, controller: controller);
            },
          ),
          GetBuilder<HomeController>(
            builder: (_) {
              return Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: BottomNavBar(
                  size: size,
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.toggleHomeScreenState(true);
                        },
                        child: BottomNavBarItem(
                            title: 'Home',
                            icon: Icons.home,
                            isActive: controller.inHomeScreen ? true : false,
                            size: size),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.toggleHomeScreenState(false);
                        },
                        child: BottomNavBarItem(
                            title: 'Search',
                            icon: Icons.search,
                            isActive: controller.inHomeScreen ? false : true,
                            size: size),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
