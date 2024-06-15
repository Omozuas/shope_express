import 'dart:async';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/circlerImage.dart';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key, required this.dateTime});
  final DateTime dateTime;
  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer timer;
  Duration duration = Duration();
  @override
  void initState() {
    calculateTimeleft(widget.dateTime);
    timer = Timer.periodic(
        Duration(seconds: 1), (_) => calculateTimeleft(widget.dateTime));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CirclerContainer(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    duration.inDays.toString().padLeft(2, '0'),
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "days",
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ],
              ),
            ),
            width: 45,
            height: 45,
            circleZize: 45),
        SizedBox(
          width: Responsive.isMobile(context)
              ? 1
              : Responsive.isTablet(context)
                  ? 5
                  : Responsive.isDesktop(context)
                      ? 5
                      : 5,
        ),
        CirclerContainer(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    duration.inHours.remainder(60).toString().padLeft(2, '0'),
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "hours",
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ],
              ),
            ),
            width: 45,
            height: 45,
            circleZize: 45),
        SizedBox(
          width: Responsive.isMobile(context)
              ? 1
              : Responsive.isTablet(context)
                  ? 5
                  : Responsive.isDesktop(context)
                      ? 5
                      : 5,
        ),
        CirclerContainer(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "mins",
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ],
              ),
            ),
            width: 45,
            height: 45,
            circleZize: 45),
        SizedBox(
          width: Responsive.isMobile(context)
              ? 1
              : Responsive.isTablet(context)
                  ? 5
                  : Responsive.isDesktop(context)
                      ? 5
                      : 5,
        ),
        CirclerContainer(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "sec",
                    softWrap: true,
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 11),
                  ),
                ],
              ),
            ),
            width: 45,
            height: 45,
            circleZize: 45)
      ],
    );
  }

  void calculateTimeleft(DateTime deadline) {
    final sec = deadline.difference(DateTime.now()).inSeconds;
    setState(() => duration = Duration(seconds: sec));
  }
}

class Countdown2 extends StatefulWidget {
  const Countdown2({super.key, required this.dateTime});
  final DateTime dateTime;
  @override
  State<Countdown2> createState() => _Countdown2State();
}

class _Countdown2State extends State<Countdown2> {
  late Timer timer;
  Duration duration = Duration();
  @override
  void initState() {
    timer = Timer.periodic(
        Duration(seconds: 1), (_) => calculateTimeleft(widget.dateTime));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CirclerContainer(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        duration.inDays.toString().padLeft(2, '0'),
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "days",
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                width: 45,
                height: 45,
                circleZize: 45),
            SizedBox(
              width: Responsive.isMobile(context)
                  ? 2
                  : Responsive.isTablet(context)
                      ? 5
                      : Responsive.isDesktop(context)
                          ? 5
                          : 5,
            ),
            CirclerContainer(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        duration.inHours
                            .remainder(60)
                            .toString()
                            .padLeft(2, '0'),
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "hours",
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                width: 45,
                height: 45,
                circleZize: 45),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CirclerContainer(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, '0'),
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "mins",
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                width: 45,
                height: 45,
                circleZize: 45),
            SizedBox(
              width: Responsive.isMobile(context)
                  ? 2
                  : Responsive.isTablet(context)
                      ? 5
                      : Responsive.isDesktop(context)
                          ? 5
                          : 5,
            ),
            CirclerContainer(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, '0'),
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "sec",
                        softWrap: true,
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                width: 45,
                height: 45,
                circleZize: 45),
          ],
        )
      ],
    );
  }

  void calculateTimeleft(DateTime deadline) {
    final sec = deadline.difference(DateTime.now()).inSeconds;
    setState(() => duration = Duration(seconds: sec));
  }
}
