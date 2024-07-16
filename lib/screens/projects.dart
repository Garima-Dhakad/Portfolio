import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:garima/global/app_asserts.dart';

import 'package:garima/global/colors.dart';
import 'package:garima/global/constants.dart';
import 'package:garima/global/text_style.dart';
import 'package:garima/helperclass.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.project1,
    AppAssets.project2,
    AppAssets.project3,
    AppAssets.project4,
    AppAssets.project5,
  ];
  List title = <String>[
    "Smart Lock Application",
    "Tetris Game",
    "Netclan Clone",
    "Pathfinder",
    "Portfolio"
  ];

  List<String> links = [
    'https://github.com/Garima-Dhakad/Smart-Lock-App',
    'https://github.com/Garima-Dhakad/Tetris-Game',
    'https://github.com/Garima-Dhakad/Netclan-Clone',
    'https://github.com/Garima-Dhakad/path-finder',
    "https://github.com/Garima-Dhakad/Portfolio"
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List content = <String>[
    '''• Engineered an advanced IOT-enabled smart locking system.
  • Crafted an IoT-based smart door lock security system leveraging Node MCU (esp8266), servo motor, Flutter, and Firebase technologies. Utilized Firebase for backend support, enabling real-time data synchronization and secure storage of access logs. This state-of-the-art system offers keyless entry, remote access, and fortified security features, ushering in a new era of advanced access control. ''',
    //
    '''• Programmed a classic Tetris game using Flutter and Dart, showcasing expertise in game logic, mechanics, and UI design.
  • Optimized game performance through efficient algorithms for block rendering, collision detection, and line clearing.
  • Demonstrated proficiency in cross-platform development with Flutter, implementing a responsive and visually pleasing
  use interface.''',
    //
    ''' Netclan Clone: Social Networking Redefined
  • Developed a cutting-edge app, inspired by Netclan, that redefines social networking experiences for users.
  • Implemented a feature-rich environment mirroring Netcian's core functionalities, providing users with a familiar and enhanced platform for connecting and sharing.
  Improved upon the original concept by incorporating intuitive UI/UX design elements, promoting seamless navigation, and fostering increased user engagement  ''',
//
    '''Developed a an interactive Pathfinder website using React, featuring an intuitive user interface real-time visualization of pathfinding algorithms.
  • Implemented Dijkstra's, A*, and breadth-first search algorithms showcasing strong problem-solving skills and a keen understanding of algorithmic principles for optimal pathfinding. ''',
//
    '''• Welcome to my Flutter portfolio project! This portfolio highlights my technical skills and project accomplishments, featuring detailed descriptions, technologies used, and links to live demos or GitHub repositories. 
  • The app features an attractive UI with a gradient styles, and a smooth navigation experience, making it easy for visitors to explore my work and learn more about me. '''
  ];

  var hoveredIndex;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40),
          buildProjectGridView(crossAxisCount: 1),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40),
          buildProjectGridView(crossAxisCount: 2),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 300,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        return InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              if (value) {
                hoveredIndex = index;
              } else {
                hoveredIndex = null;
              }
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Visibility(
                visible: index == hoveredIndex,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  transform: index == hoveredIndex ? onH0verEffect : null,
                  curve: Curves.easeIn,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      AppColors.themeColor.withOpacity(0.7),
                      AppColors.themeColor.withOpacity(0.8),
                      AppColors.themeColor.withOpacity(0.9),
                      AppColors.themeColor.withOpacity(1.0),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                  child: Column(
                    children: [
                      Constants.sizedBox(height: 20.0),
                      Text(
                        title[index],
                        style: AppTextStyles.montserratStyle(
                            color: Colors.black87, fontSize: 20),
                      ),
                      Constants.sizedBox(height: 10.0),

                      // Container(
                      //   width: 300.0, // Fixed width
                      //   height: 150.0, // Fixed height
                      //   padding: const EdgeInsets.all(16.0),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(15.0),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withOpacity(0.2),
                      //         spreadRadius: 5,
                      //         blurRadius: 7,
                      //         offset: const Offset(0, 3),
                      //       ),
                      //     ],
                      //   ),
                      //   child: SingleChildScrollView(
                      //     child: Text(
                      //       content[index],
                      //       style: AppTextStyles.normalStyle(
                      //           color: Colors.black87, fontSize: 12),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                      Text(
                        content[index],
                        style: AppTextStyles.normalStyle(
                            color: Colors.black87, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),

                      Constants.sizedBox(height: 10.0),
                      IconButton(
                          onPressed: () => _launchURL(links[index]),
                          icon: const Icon(Icons.link_outlined)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Text buildProjectText() {
    return Text(
      'Projects ',
      style: AppTextStyles.headingStyles(fontSize: 50.0),
    );
  }
}
