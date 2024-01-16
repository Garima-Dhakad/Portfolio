import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garima/global/app_assets.dart';
import 'package:garima/global/buttons.dart';
import 'package:garima/global/colors.dart';
import 'package:garima/global/constants.dart';
import 'package:garima/global/text_style.dart';
import 'package:animate_do/animate_do.dart';
import 'package:garima/helperclass.dart';
import 'package:garima/profile_animatopn.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse(
      'https://drive.google.com/file/d/196x49V9IJWE-wmJIc3UaDhdb600i2PwT/view');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url1 =
      Uri.parse('https://www.linkedin.com/in/garima-dhakad-822389227/');
  Future<void> _linkedin() async {
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url2 = Uri.parse('https://github.com/Garima-Dhakad');
  Future<void> _github() async {
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url');
    }
  }

  final socialButtons = <String>[
    AppAssets.linkedIn,
    AppAssets.insta,
    AppAssets.github,
  ];

  var socialBI;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25),
          const ProfileAnimation(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          // duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15),
        FadeInRight(
          // duration: const Duration(milliseconds: 1400),
          child: Text(
            "Garima Dhakad",
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                "And I'm a ",
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("Flutter Developer",
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                ],
                pause: const Duration(milliseconds: 1000),
                // displayFullTextOnTap: true,
                // stopPauseOnTap: true,
              ),
            ],
          ),
        ),
        Constants.sizedBox(height: 15),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Expanded(
            child: Text(
              "Passionate and skilled Computer Engineering pursuing graduation from NIT, Krurkshetra and experienced App Developer, specializing in Flutter and Firebase for mobile app development",
              style: AppTextStyles.normalStyle(),
            ),
          ),
        ),
        Constants.sizedBox(height: 22),
        FadeInUp(
          duration: const Duration(microseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: _linkedin,
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBI = index;
                      } else {
                        socialBI = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                    asset: socialButtons[index],
                    hover: socialBI == index ? true : false,
                  ),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: _launchUrl, buttonName: 'Download CV'),
        ),
      ],

      // CircleAvatar(
      //   radius: 170,
      //   backgroundImage: AssetImage(
      //     AppAssets.profile,
      //   ),
      // ),
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}

// CircleAvatar(
//   radius: 170,
//   backgroundImage: AssetImage(
//     AppAssets.profile,
//   ),
// ),