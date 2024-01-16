import 'package:flutter/material.dart';
import 'package:garima/global/app_assets.dart';
import 'package:garima/global/buttons.dart';
import 'package:garima/global/colors.dart';
import 'package:garima/global/constants.dart';
import 'package:garima/global/text_style.dart';
import 'package:garima/helperclass.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isWeb = false;
  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServiceText(),
          Constants.sizedBox(height: 60),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'App Development',
              about:
                  "Are you interested in the great Mobile app? Let's make it a reality",
              asset: AppAssets.android,
              hover: isApp,
            ),
          ),
          Constants.sizedBox(height: 60),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isWeb = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Web Development',
              about:
                  "Do you have an idea for your next great website? Let's make it a reality",
              asset: AppAssets.web,
              hover: isWeb,
            ),
          ),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServiceText(),
          Constants.sizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  about:
                      "Are you interested in the great Mobile app? Let's make it a reality",
                  asset: AppAssets.android,
                  hover: isApp,
                  // width: size.width - 10,
                  // hoverWidth: size.width
                ),
              ),
              Constants.sizedBox(width: 20),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isWeb = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Web Development',
                  about:
                      "Do you have an idea for your next great website? Let's make it a reality",
                  asset: AppAssets.web,
                  hover: isWeb,
                ),
              ),
              // Image.asset(
              //   AppAssets.web,
              //   width: 50,
              //   height: 50,
              //   // color: AppColors.themeColor,
              // ),
            ],
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServiceText(),
          Constants.sizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'App Development',
                  about:
                      "Are you interested in the great Mobile app? Let's make it a reality",
                  asset: AppAssets.android,
                  hover: isApp,
                ),
              ),
              Constants.sizedBox(width: 50),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isWeb = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Web Development',
                  about:
                      "Do you have an idea for your next great website? Let's make it a reality",
                  asset: AppAssets.web,
                  hover: isWeb,
                ),
              ),
              // Image.asset(
              //   AppAssets.web,
              //   width: 50,
              //   height: 50,
              //   // color: AppColors.themeColor,
              // ),
            ],
          )
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor,
    );
  }

  Text buildMyServiceText() {
    return Text(
      'What I can do? ',
      style: AppTextStyles.headingStyles(fontSize: 30.0),
    );
  }

  AnimatedContainer buildAnimatedContainer(
      {required String title,
      required String asset,
      required String about,
      required bool hover,
      double width = 350,
      double hoverWidth = 360}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      transform: hover ? onHoverActive : onHoverRemove,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 80,
            height: 80,
            // color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            about,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 16),
          // AppButtons.buildMaterialButton(
          //   buttonName: "Read More",
          //   onTap: () {},
          // )
        ],
      ),
    );
  }
}

// Do you have an idea for your next great website? Let's make it a reality
//Are you interested in the great Mobile app? Let's make it a reality
