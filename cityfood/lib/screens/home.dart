import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/model/cards/cardcategory.dart';
import 'package:cityfood/model/homeSlide_Model.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/appBar.dart';
import 'package:cityfood/widgets/cards/cartegoryCard.dart';
import 'package:cityfood/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/circlerImage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  List<CardCatrgory> categoryCard = [
    CardCatrgory(imgs: "assets/images/clothes1.png", nameOfItem: "Hoodie"),
    CardCatrgory(imgs: "assets/images/friedge1.png", nameOfItem: "electronics"),
    CardCatrgory(imgs: "assets/images/androidpic3.webp", nameOfItem: "android"),
    CardCatrgory(imgs: "assets/images/funiture1.png", nameOfItem: "Funiturs"),
    CardCatrgory(
        imgs: "assets/images/headsetImg1.png", nameOfItem: "head phones"),
    CardCatrgory(imgs: "assets/images/iphone3.png", nameOfItem: "iphones"),
    CardCatrgory(imgs: "assets/images/pcimg2.png", nameOfItem: "Laptops"),
    CardCatrgory(imgs: "assets/images/shoe1.png", nameOfItem: "shoes"),
  ];
  final List<HomeSlide> homeSlide = [
    HomeSlide(
        imgs: "assets/images/clothes1.png",
        nameOfItem: "BlackHoodie Mixed Gender",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/friedge1.png",
        nameOfItem: "Brand New LG Friedge",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/androidpic3.webp",
        nameOfItem: "Samsung Galaxy A15 ",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/funiture1.png",
        nameOfItem: "A Yellow Funiture Couch",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/headsetImg1.png",
        nameOfItem: "Options Wireless Headphone",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/iphone3.png",
        nameOfItem: "BrandNew Iphone xr",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/pcimg2.png",
        nameOfItem: "A BranNew Dell Pc",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
    HomeSlide(
        imgs: "assets/images/shoe1.png",
        nameOfItem: "AirJordan Sport Shoe",
        reviewImg1: 'assets/images/bacimg3.jpg',
        reviewImg2: 'assets/images/bacimg2.jpg',
        reviewImg3: 'assets/images/bacimg3.jpg',
        reviewImg4: 'assets/images/bacimg1.jpg'),
  ];

  //   {
  //  { imd:"assets/images/clothes1.png","cloths"},
  //   {"assets/images/friedge1.png"},
  //   {"assets/images/androidpic3.webp"},
  //  { "assets/images/funiture1.png"},
  //   {"assets/images/headsetImg1.png"},
  //  { "assets/images/iphone2.png"},
  //  { "assets/images/pcimg2.png"},
  //  { "assets/images/shoe1.png"},
  //  { "assets/images/washingmachin1.png"},
  //  { "assets/images/wristwatch1.png"}
  // };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      backgroundColor: Colors.grey[200],
      drawer: SideMenuWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                    Center(child: FlexAppBar()),
                    if (Responsive.isTablet(context))
                      CarouselSlider(
                        items: homeSlide
                            .map((e) => Column(
                                  children: [
                                    Container(
                                      // width: 100,
                                      height: 300,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(e.imgs,
                                              width: 400,
                                              height: 350,
                                              fit: BoxFit.contain,
                                              alignment:
                                                  Alignment.bottomCenter),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 70,
                                                        image: e.reviewImg1,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 20,
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 90,
                                                        image: e.reviewImg2,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 40,
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 90,
                                                        image: e.reviewImg3,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 60,
                                                      child:
                                                          CirclerImageContainer(
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
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'reviews',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 70,
                                                        image:
                                                            'assets/images/bacimg3.jpg',
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 20,
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 90,
                                                        image:
                                                            'assets/images/bacimg2.jpg',
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 40,
                                                      child:
                                                          CirclerImageContainer(
                                                        width: 40,
                                                        height: 40,
                                                        circleZize: 90,
                                                        image:
                                                            'assets/images/bacimg3.jpg',
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 60,
                                                      child:
                                                          CirclerImageContainer(
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
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'reviews',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 120.0),
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
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 9),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            BoxShape.rectangle,
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
                                                                color: Colors
                                                                    .black),
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
                                                        child:
                                                            CirclerImageContainer(
                                                          width: 40,
                                                          height: 40,
                                                          circleZize: 70,
                                                          image:
                                                              'assets/images/bacimg3.jpg',
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 20,
                                                        child:
                                                            CirclerImageContainer(
                                                          width: 40,
                                                          height: 40,
                                                          circleZize: 90,
                                                          image:
                                                              'assets/images/bacimg2.jpg',
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 40,
                                                        child:
                                                            CirclerImageContainer(
                                                          width: 40,
                                                          height: 40,
                                                          circleZize: 90,
                                                          image:
                                                              'assets/images/bacimg3.jpg',
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 60,
                                                        child:
                                                            CirclerImageContainer(
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
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            Icons
                                                                .star_half_sharp,
                                                            color: Colors.black,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '100+',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            'reviews',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
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
                                                alignment:
                                                    Alignment.bottomRight,
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
                    image: DecorationImage(
                        image: AssetImage('assets/images/bacimg1.jpg'),
                        fit: BoxFit.cover)),
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
                            color: Colors.orange,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListCategoryard(
                            cardCatrgory: categoryCard,
                          )),
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
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListCategoryard(
                            cardCatrgory: categoryCard,
                          )),
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
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ListCategoryard(
                            cardCatrgory: categoryCard,
                          )),
                    ],
                  ),
                )

              // Center(child: FlexAppBar())
            ],
          ),
        ),
      ),
    );
  }
}
