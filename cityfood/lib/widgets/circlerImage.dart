import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CirclerImageContainer extends StatelessWidget {
  CirclerImageContainer(
      {super.key,
      required this.image,
      required this.width,
      required this.height,
      required this.circleZize});
  double width;
  double height;
  String image;
  double circleZize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,

      // padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(circleZize),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CirclerContainer extends StatelessWidget {
  CirclerContainer(
      {super.key,
      required this.child,
      required this.width,
      required this.color,
      required this.height,
      required this.circleZize});
  double width;
  double height;
  Widget child;
  Color color;
  double circleZize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: child,
      // padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: color,
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(circleZize),
      ),
    );
  }
}
