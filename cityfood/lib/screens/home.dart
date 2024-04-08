import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/appBar.dart';
import 'package:cityfood/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/circlerImage.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: SideMenuWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: Responsive.isMobile(context)
                    ? 650
                    : Responsive.isTablet(context)
                        ? 700
                        : 500,
                child: Column(
                  children: [
                    Center(child: FlexAppBar()),
                    SizedBox(
                      height: 20,
                    ),
                    if (Responsive.isTablet(context))
                      Container(
                        // width: 100,
                        height: 300,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/headsetImg1.png',
                                width: 400,
                                height: 350,
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter),
                            Image.asset(
                              'assets/images/headsetImg1.png',
                              width: 100,
                              height: 300,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                            ),
                          ],
                        ),
                      ),
                    if (Responsive.isTablet(context))
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.headphones,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Options Brand',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 400,
                                child: Text(
                                  'Options Wireless Headphone',
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 40,
                                    // padding: EdgeInsets.only(top: 5),
                                    child: Stack(children: [
                                      Positioned(
                                        left: 0,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 70,
                                          image: 'assets/images/bacimg3.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg2.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 40,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg3.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg1.jpg',
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star_half_sharp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '100+',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'reviews',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'shop now',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        // width: 50,
                        height: 250,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/headsetImg1.png',
                              width: 200,
                              height: 400,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                            ),
                            Image.asset(
                              'assets/images/headsetImg1.png',
                              width: 50,
                              height: 400,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomRight,
                            ),
                          ],
                        ),
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.headphones,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Options Brand',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 350,
                                child: Text(
                                  'Options Wireless Headphone',
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 40,
                                    // padding: EdgeInsets.only(top: 5),
                                    child: Stack(children: [
                                      Positioned(
                                        left: 0,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 70,
                                          image: 'assets/images/bacimg3.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg2.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 40,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg3.jpg',
                                        ),
                                      ),
                                      Positioned(
                                        left: 60,
                                        child: CirclerImageContainer(
                                          width: 40,
                                          height: 40,
                                          circleZize: 90,
                                          image: 'assets/images/bacimg1.jpg',
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            Icons.star_half_sharp,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '100+',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'reviews',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'shop now',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (Responsive.isDesktop(context))
                      Center(
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 120.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.headphones,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Options Brand',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 470,
                                      child: Text(
                                        'Options Wireless Headphone',
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 55,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 9),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(6),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  'shop now',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          height: 40,
                                          // padding: EdgeInsets.only(top: 5),
                                          child: Stack(children: [
                                            Positioned(
                                              left: 0,
                                              child: CirclerImageContainer(
                                                width: 40,
                                                height: 40,
                                                circleZize: 70,
                                                image:
                                                    'assets/images/bacimg3.jpg',
                                              ),
                                            ),
                                            Positioned(
                                              left: 20,
                                              child: CirclerImageContainer(
                                                width: 40,
                                                height: 40,
                                                circleZize: 90,
                                                image:
                                                    'assets/images/bacimg2.jpg',
                                              ),
                                            ),
                                            Positioned(
                                              left: 40,
                                              child: CirclerImageContainer(
                                                width: 40,
                                                height: 40,
                                                circleZize: 90,
                                                image:
                                                    'assets/images/bacimg3.jpg',
                                              ),
                                            ),
                                            Positioned(
                                              left: 60,
                                              child: CirclerImageContainer(
                                                width: 40,
                                                height: 40,
                                                circleZize: 90,
                                                image:
                                                    'assets/images/bacimg1.jpg',
                                              ),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                ),
                                                Icon(
                                                  Icons.star_half_sharp,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '100+',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'reviews',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                              child: Container(
                                // width: 50,
                                height: 400,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/headsetImg1.png',
                                      width: 400,
                                      height: 400,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                    Image.asset(
                                      'assets/images/headsetImg1.png',
                                      width: 100,
                                      height: 400,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomRight,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bacimg1.jpg'),
                        fit: BoxFit.cover)),
              )

              // Center(child: FlexAppBar())
            ],
          ),
        ),
      ),
    );
  }
}
