import 'package:flutter/material.dart';

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
