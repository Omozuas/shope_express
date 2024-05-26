import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/appbarname.dart';
import 'package:cityfood/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FlexAppBar extends StatefulWidget {
  FlexAppBar({
    super.key,
  });

  @override
  State<FlexAppBar> createState() => _FlexAppBarState();
}

class _FlexAppBarState extends State<FlexAppBar> {
  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 0;
  double ratingValue = 0.0;
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      scrollPosition = _scrollController.position.pixels;
      print(scrollPosition);
    });
  }

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    var screenSize = MediaQuery.of(context).size;
    opacity = scrollPosition < MediaQuery.of(context).size.height * 0.40
        ? scrollPosition / (MediaQuery.of(context).size.height * 0.40)
        : 1;
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: Colors.grey[200],
      drawer: SideMenuWidget(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100),
        child: Padding(
          padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
          child: Container(
            // width: 1050,
            child: Responsive.isDesktop(context)
                ? Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Shop Express',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[0] = true
                                      : _isHovering[0] = false;
                                });
                              },
                              onTap: () => controller.selectedIndex.value = 0,
                              child: Text(
                                'HOME',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: _isHovering[0]
                                        ? GlobalColors.orange
                                        : controller.selectedIndex.value == 0
                                            ? GlobalColors.orange
                                            : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[1] = true
                                      : _isHovering[1] = false;
                                });
                              },
                              onTap: () {},
                              child: Text(
                                'ABOUT',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: _isHovering[1]
                                        ? GlobalColors.orange
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[2] = true
                                      : _isHovering[2] = false;
                                });
                              },
                              onTap: () {},
                              child: Text(
                                'FAQ',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: _isHovering[2]
                                        ? GlobalColors.orange
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[3] = true
                                      : _isHovering[3] = false;
                                });
                              },
                              onTap: () => controller.selectedIndex.value = 1,
                              child: Text(
                                'Get a Store',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: _isHovering[3]
                                        ? GlobalColors.orange
                                        : controller.selectedIndex.value == 1
                                            ? GlobalColors.orange
                                            : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[4] = true
                                      : _isHovering[4] = false;
                                });
                              },
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.person,
                                color: _isHovering[4]
                                    ? GlobalColors.orange
                                    : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[5] = true
                                      : _isHovering[5] = false;
                                });
                              },
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.cart,
                                color: _isHovering[5]
                                    ? GlobalColors.orange
                                    : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[6] = true
                                      : _isHovering[6] = false;
                                });
                              },
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.heart,
                                color: _isHovering[6]
                                    ? GlobalColors.orange
                                    : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[7] = true
                                      : _isHovering[7] = false;
                                });
                              },
                              onTap: () => controller.selectedIndex.value = 3,
                              child: Row(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: _isHovering[7]
                                            ? GlobalColors.orange
                                            : controller.selectedIndex.value ==
                                                    3
                                                ? GlobalColors.orange
                                                : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.login_outlined,
                                    color: _isHovering[7]
                                        ? GlobalColors.orange
                                        : controller.selectedIndex.value == 3
                                            ? GlobalColors.orange
                                            : Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
                : Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.black),
                          onPressed:
                              context.read<MenuAppController>().controlMenu,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[4] = true
                                      : _isHovering[4] = false;
                                });
                              },
                              onTap: () => controller.selectedIndex.value = 1,
                              child: Icon(
                                CupertinoIcons.person,
                                color: _isHovering[4]
                                    ? GlobalColors.orange
                                    : controller.selectedIndex.value == 1
                                        ? GlobalColors.orange
                                        : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[5] = true
                                      : _isHovering[5] = false;
                                });
                              },
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.cart,
                                color: _isHovering[5]
                                    ? GlobalColors.orange
                                    : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[6] = true
                                      : _isHovering[6] = false;
                                });
                              },
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.heart,
                                color: _isHovering[6]
                                    ? GlobalColors.orange
                                    : Colors.black,
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
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[7] = true
                                      : _isHovering[7] = false;
                                });
                              },
                              onTap: () => controller.selectedIndex.value = 3,
                              child: Row(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: _isHovering[7]
                                            ? GlobalColors.orange
                                            : controller.selectedIndex.value ==
                                                    3
                                                ? GlobalColors.orange
                                                : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.login_outlined,
                                    color: _isHovering[7]
                                        ? GlobalColors.orange
                                        : controller.selectedIndex.value == 3
                                            ? GlobalColors.orange
                                            : Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5), bottom: Radius.circular(5)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Obx(() => controller.screen[controller.selectedIndex.value]),
      ),
    );
  }
}
