import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/colorConstants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.child,
    required this.size,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 10,
      //width: size.width * 0.6,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: kButtonColor,
          boxShadow: [
            BoxShadow(
              color: kOuterButtonShadow,
              offset: Offset(0, -5),
              blurRadius: 6,
            )
          ]),
      child: child,
    );
  }
}
