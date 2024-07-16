import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:garima/global/app_asserts.dart';
import 'package:garima/global/buttons.dart';
import 'package:garima/global/colors.dart';
import 'package:garima/global/constants.dart';
import 'package:garima/global/text_style.dart';
import 'package:garima/helperclass.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(width: 35),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25),
          Expanded(child: buildAboutMeContents()),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25),
          Expanded(child: buildAboutMeContents()),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: CircleAvatar(
        radius: 170,
        backgroundImage: AssetImage(
          AppAssets.profile,
        ),
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'About ',
              style: AppTextStyles.headingStyles(fontSize: 50.0),
              children: [
                TextSpan(
                  text: 'Me',
                  style: AppTextStyles.headingStyles(
                      fontSize: 50, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            "Flutter Developer",
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            "Passionate and skilled Computer Engineering graduate from the National Institute of Technology, Kurukshetra, with a solid foundation in programming languages such as C++, and Java. Experienced Application Developer at Tetrahedron Manufacturing Services, specializing in Flutter and Firebase for mobile app development. A creative and organized individual with a flair for fine arts, actively contributing to NIT Kurukshetra's Fine Arts Club and Anamika Society. Developed strong managerial and organizational skills through successful event planning and execution. Open to exciting opportunities in the dynamic field of technology.",
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 15),
        // FadeInUp(
        //   duration: const Duration(milliseconds: 1800),
        //   child: AppButtons.buildMaterialButton(
        //       onTap: () {}, buttonName: 'Read More'),
        // ),
      ],
    );
  }
}
