import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/colorConstants.dart';
import 'package:netflix_clone/controllers/homeController.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    Key? key,
    required this.size,
    required this.isActive,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Size size;
  final bool isActive;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
          lightSource: LightSource.top,
          color: isActive ? Colors.red : Colors.black,
          shape: NeumorphicShape.flat,
          depth: isActive ? -10 : 0,
          shadowDarkColorEmboss: Colors.black,
          shadowLightColorEmboss: Colors.red[900],
          //surfaceIntensity: 1,
          shadowDarkColor: Colors.black,
          shadowLightColor: Colors.black,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(24)),
        ),
        child: SizedBox(
            width: size.width * 0.3,
            height: kToolbarHeight + 16,
            child: Row(
              children: [
                Spacer(),
                Icon(
                  icon,
                  color: isActive ? Colors.white : kTextColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: isActive ? Colors.white : kTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            )));
  }
}
