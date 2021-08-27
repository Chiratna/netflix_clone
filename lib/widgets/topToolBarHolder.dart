import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/colorConstants.dart';

class TopToolBarHolder extends StatelessWidget {
  const TopToolBarHolder({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 10,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
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
