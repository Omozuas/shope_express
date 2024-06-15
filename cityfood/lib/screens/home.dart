import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/model/cards/cardcategory.dart';
import 'package:cityfood/model/homeSlide_Model.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/cards/cartegoryCard.dart';
import 'package:cityfood/widgets/countdown/countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/circlerImage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
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
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: Responsive.isMobile(context)
              ? 720
              : Responsive.isTablet(context)
                  ? 700
                  : 570,
          child: Column(
            children: [
              // Center(child: FlexAppBar()),
              if (Responsive.isTablet(context))
                CarouselSlider(
                  items: homeSlide
                      .map((e) => Column(
                            children: [
                              Container(
                                // width: 100,
                                height: 300,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(e.imgs,
                                        width: 400,
                                        height: 350,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.bottomCenter),
                                    Image.asset(
                                      e.imgs,
                                      width: 100,
                                      height: 300,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                          e.nameOfItem,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                  image: e.reviewImg1,
                                                ),
                                              ),
                                              Positioned(
                                                left: 20,
                                                child: CirclerImageContainer(
                                                  width: 40,
                                                  height: 40,
                                                  circleZize: 90,
                                                  image: e.reviewImg2,
                                                ),
                                              ),
                                              Positioned(
                                                left: 40,
                                                child: CirclerImageContainer(
                                                  width: 40,
                                                  height: 40,
                                                  circleZize: 90,
                                                  image: e.reviewImg3,
                                                ),
                                              ),
                                              Positioned(
                                                left: 60,
                                                child: CirclerImageContainer(
                                                  width: 40,
                                                  height: 40,
                                                  circleZize: 90,
                                                  image: e.reviewImg4,
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
                                      SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1),
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
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                  options: CarouselOptions(
                      initialPage: 0,
                      viewportFraction: 1,
                      autoPlay: true,
                      height: 600,
                      // aspectRatio: 16 / 2,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.5,
                      disableCenter: true),
                ),
              if (Responsive.isMobile(context))
                CarouselSlider(
                  items: homeSlide
                      .map((e) => Column(
                            children: [
                              Container(
                                // width: 50,
                                height: 350,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      e.imgs,
                                      width: 250,
                                      height: 300,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                    Image.asset(
                                      e.imgs,
                                      width: 50,
                                      height: 300,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.bottomRight,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 30,
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
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          e.nameOfItem,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                            width: 10,
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1),
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
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                  options: CarouselOptions(
                      initialPage: 0,
                      viewportFraction: 1,
                      autoPlay: true,
                      height: 660,
                      // aspectRatio: 16 / 2,
                      scrollDirection: Axis.horizontal,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      enlargeFactor: 0.5,
                      disableCenter: true),
                ),

              if (Responsive.isDesktop(context))
                CarouselSlider(
                  items: homeSlide
                      .map((e) => Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 120.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            e.nameOfItem,
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(6),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .shopping_cart_outlined,
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
                                Flexible(
                                  child: Container(
                                    // width: 50,
                                    height: 400,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          e.imgs,
                                          width: 400,
                                          height: 400,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.bottomLeft,
                                        ),
                                        Image.asset(
                                          e.imgs,
                                          width: 100,
                                          height: 400,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.bottomRight,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1,
                      height: 500,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      disableCenter: true,
                      enlargeFactor: 0.5),
                ),
            ],
          ),
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/images/bacimg1.jpg'),
              //     fit: BoxFit.cover)
              color: GlobalColors.orange),
        ),

        SizedBox(
          height: 25,
        ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: GlobalColors.willoGrove,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  'Browse by Category',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListCategoryard(
                      cardCatrgory: categoryCard,
                      onTap: () {},
                    )),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 1000,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0, right: 28),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.headphones,
                                          color: GlobalColors.willoGrove,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'headPhone',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Enhance Your Music Experience",
                                      softWrap: true,
                                      style: TextStyle(
                                          wordSpacing: 2, fontSize: 40),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Countdown(
                                        dateTime: DateTime.now()
                                            .add(Duration(days: 6))),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[0] = true
                                              : _isHovering[0] = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 9),
                                        decoration: BoxDecoration(
                                          color: _isHovering[0]
                                              ? GlobalColors.orange
                                              : Colors.white,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: _isHovering[0]
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'check it out',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: _isHovering[0]
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Flexible(
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/headsetImg2.png",
                                        width: 300,
                                        // height: 400,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.bottomLeft,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: GlobalColors.orange),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "the best offer".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "see more",
                              style: TextStyle(
                                color: GlobalColors.orange,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: GlobalColors.orange,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 340),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      onHover: (value) {},
                      child: Container(
                        width: 280,
                        child: Card(
                          elevation: 0,
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 280,
                                  height: 180,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: Image.asset(
                                        "assets/images/wristwatch1.png",
                                        height: 160,
                                        width: 130,
                                      )),
                                      Positioned(
                                          left: 5,
                                          top: 10,
                                          child: Container(
                                              width: 40,
                                              height: 20,
                                              child: Center(
                                                child: Text(
                                                  "-10%",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: GlobalColors.orange))),
                                      Positioned(
                                          right: 10,
                                          top: 10,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                                width: 25,
                                                height: 25,
                                                child: Center(
                                                  child: Icon(
                                                    CupertinoIcons.heart,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    color: GlobalColors.orange
                                                        .withOpacity(0.4))),
                                          ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "hupsin watch".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "wristwatch".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RatingBarIndicator(
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_border_outlined,
                                    color: GlobalColors.orange,
                                  ),
                                  unratedColor: Colors.black,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                // RatingBar.builder(
                                //     itemSize: 20,
                                //     initialRating: 3.4,
                                //     minRating: 1,
                                //     direction: Axis.horizontal,
                                //     allowHalfRating: true,
                                //     itemCount: 4,
                                //     itemPadding: const EdgeInsets.symmetric(
                                //         horizontal: 3),
                                //     itemBuilder: (context, _) => Icon(
                                //           Icons.star,
                                //           color: GlobalColors.orange,
                                //           size: 20,
                                //         ),
                                //     onRatingUpdate: (rating) {
                                //       // ratingValue = rating;
                                //       // print(rating);
                                //     }
                                //     ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$5000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 220,
                                      height: 40,
                                      child: Center(
                                        child: Text("add to cart".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      decoration: BoxDecoration(
                                          color: GlobalColors.orange,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

        if (Responsive.isTablet(context))
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: Colors.orange,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  'Browse by Category',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListCategoryard(
                      cardCatrgory: categoryCard,
                      onTap: () {},
                    )),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 748,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.headphones,
                                          color: GlobalColors.willoGrove,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'headPhone',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Enhance Your Music Experience",
                                      softWrap: true,
                                      style: TextStyle(
                                          wordSpacing: 2, fontSize: 40),
                                    ),
                                    Text(
                                      "10% off",
                                      softWrap: true,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Countdown(
                                        dateTime: DateTime.now()
                                            .add(Duration(days: 6))),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[0] = true
                                              : _isHovering[0] = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 9),
                                        decoration: BoxDecoration(
                                          color: _isHovering[0]
                                              ? GlobalColors.orange
                                              : Colors.white,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            width: 2,
                                            style: BorderStyle.solid,
                                            color: _isHovering[0]
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'check it out',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: _isHovering[0]
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Flexible(
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/headsetImg2.png",
                                        width: 300,
                                        // height: 300,
                                        fit: BoxFit.contain,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(color: GlobalColors.orange),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "the best offer".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "see more",
                              style: TextStyle(
                                color: GlobalColors.orange,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: GlobalColors.orange,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 340),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      onHover: (value) {},
                      child: Container(
                        width: 280,
                        child: Card(
                          elevation: 0,
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 280,
                                  height: 180,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: Image.asset(
                                        "assets/images/wristwatch1.png",
                                        height: 160,
                                        width: 130,
                                      )),
                                      Positioned(
                                          left: 5,
                                          top: 10,
                                          child: Container(
                                              width: 40,
                                              height: 20,
                                              child: Center(
                                                child: Text(
                                                  "-10%",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: GlobalColors.orange))),
                                      Positioned(
                                          right: 10,
                                          top: 10,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                                width: 25,
                                                height: 25,
                                                child: Center(
                                                  child: Icon(
                                                    CupertinoIcons.heart,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    color: GlobalColors.orange
                                                        .withOpacity(0.4))),
                                          ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "hupsin watch".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "wristwatch".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RatingBarIndicator(
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_border_outlined,
                                    color: GlobalColors.orange,
                                  ),
                                  unratedColor: Colors.black,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                // RatingBar.builder(
                                //     itemSize: 20,
                                //     initialRating: 3.4,
                                //     minRating: 1,
                                //     direction: Axis.horizontal,
                                //     allowHalfRating: true,
                                //     itemCount: 4,
                                //     itemPadding: const EdgeInsets.symmetric(
                                //         horizontal: 3),
                                //     itemBuilder: (context, _) => Icon(
                                //           Icons.star,
                                //           color: GlobalColors.orange,
                                //           size: 20,
                                //         ),
                                //     onRatingUpdate: (rating) {
                                //       // ratingValue = rating;
                                //       // print(rating);
                                //     }
                                //     ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$5000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 220,
                                      height: 40,
                                      child: Center(
                                        child: Text("add to cart".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      decoration: BoxDecoration(
                                          color: GlobalColors.orange,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        if (Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.category_outlined,
                      color: Colors.orange,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  'Browse by Category',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListCategoryard(
                      cardCatrgory: categoryCard,
                      onTap: () {},
                    )),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        // width: 450,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.headphones,
                                            color: GlobalColors.willoGrove,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'headPhone',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Enhance Your Music Experience",
                                        softWrap: true,
                                        style: TextStyle(
                                            wordSpacing: 2, fontSize: 20),
                                      ),
                                      Text(
                                        "10% off",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Countdown2(
                                          dateTime: DateTime.now()
                                              .add(Duration(days: 6))),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? _isHovering[0] = true
                                                : _isHovering[0] = false;
                                            print(value);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 9),
                                          decoration: BoxDecoration(
                                            color: _isHovering[0]
                                                ? GlobalColors.orange
                                                : Colors.white,
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              width: 2,
                                              style: BorderStyle.solid,
                                              color: _isHovering[0]
                                                  ? Colors.white
                                                  : Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'check it out',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: _isHovering[0]
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                Flexible(
                                  child: Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/headsetImg2.png",
                                          width: 165,
                                          // height: 300,
                                          fit: BoxFit.contain,
                                          alignment: Alignment.topRight,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(color: GlobalColors.orange),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "the best offer".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "see more",
                              style: TextStyle(
                                color: GlobalColors.orange,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: GlobalColors.orange,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 340),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      onHover: (value) {},
                      child: Container(
                        width: 280,
                        child: Card(
                          elevation: 0,
                          color: Colors.white.withOpacity(0.9),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 280,
                                  height: 180,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: Image.asset(
                                        "assets/images/wristwatch1.png",
                                        height: 160,
                                        width: 130,
                                      )),
                                      Positioned(
                                          left: 5,
                                          top: 10,
                                          child: Container(
                                              width: 40,
                                              height: 20,
                                              child: Center(
                                                child: Text(
                                                  "-10%",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: GlobalColors.orange))),
                                      Positioned(
                                          right: 10,
                                          top: 10,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                                width: 25,
                                                height: 25,
                                                child: Center(
                                                  child: Icon(
                                                    CupertinoIcons.heart,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    color: GlobalColors.orange
                                                        .withOpacity(0.4))),
                                          ))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "hupsin watch".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "wristwatch".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RatingBarIndicator(
                                  rating: 2.75,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_border_outlined,
                                    color: GlobalColors.orange,
                                  ),
                                  unratedColor: Colors.black,
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                // RatingBar.builder(
                                //     itemSize: 20,
                                //     initialRating: 3.4,
                                //     minRating: 1,
                                //     direction: Axis.horizontal,
                                //     allowHalfRating: true,
                                //     itemCount: 4,
                                //     itemPadding: const EdgeInsets.symmetric(
                                //         horizontal: 3),
                                //     itemBuilder: (context, _) => Icon(
                                //           Icons.star,
                                //           color: GlobalColors.orange,
                                //           size: 20,
                                //         ),
                                //     onRatingUpdate: (rating) {
                                //       // ratingValue = rating;
                                //       // print(rating);
                                //     }
                                //     ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$5000',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 220,
                                      height: 40,
                                      child: Center(
                                        child: Text("add to cart".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      decoration: BoxDecoration(
                                          color: GlobalColors.orange,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        SizedBox(
          height: 25,
        ),

        // Center(child: FlexAppBar())
      ],
    );
  }
}
