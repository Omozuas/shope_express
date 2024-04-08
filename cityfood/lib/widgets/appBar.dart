import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FlexAppBar extends StatelessWidget {
  const FlexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
      child: Container(
        // width: 1050,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: context.read<MenuAppController>().controlMenu,
              ),
            if (Responsive.isDesktop(context))
              Text(
                'Shop Express',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            if (Responsive.isDesktop(context))
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'ABOUT',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Get a Store',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 20
                          : Responsive.isMobile(context)
                              ? 30
                              : 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.cart,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 20
                          : Responsive.isMobile(context)
                              ? 30
                              : 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    CupertinoIcons.heart,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 20
                          : Responsive.isMobile(context)
                              ? 30
                              : 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.login_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(5), bottom: Radius.circular(5)),
        ),
      ),
    );
  }
}
