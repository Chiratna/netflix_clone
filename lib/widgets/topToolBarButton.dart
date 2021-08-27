import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants/colorConstants.dart';

class TopToolBarButton extends StatelessWidget {
  const TopToolBarButton({
    Key? key,
    required this.size,
    required this.name,
    required this.isActive,
  }) : super(key: key);

  final Size size;
  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.25,
      decoration: BoxDecoration(
          color: isActive ? kBackgroundCOlor : kButtonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: kShadowColor2,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: kShadowColor1,
                    blurRadius: 4,
                    offset: Offset(-1, -2),
                  )
                ]
              : []),
      child: Center(
        child: Text('$name',
            style: GoogleFonts.lato(
              color: isActive ? Colors.red : kTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )),
      ),
    );
  }
}
