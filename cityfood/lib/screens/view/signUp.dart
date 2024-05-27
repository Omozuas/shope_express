import 'package:carousel_slider/carousel_slider.dart';
import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/appbarname.dart';
import 'package:cityfood/widgets/onboard_model.dart';
import 'package:cityfood/widgets/textField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        GlobalColors.orange,
      ])),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Responsive.isDesktop(context))
                  Flexible(
                      child: Column(
                    children: [
                      CarouselSlider(
                        items: contents
                            .map((e) => Column(
                                  children: [
                                    Image.asset(
                                      e.image,
                                      height: 550,
                                    ),
                                    Text(
                                      e.title,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                    ),
                                    Text(
                                      e.discription,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ))
                            .toList(),
                        options: CarouselOptions(
                            initialPage: 0,
                            viewportFraction: 1,
                            autoPlay: true,
                            height: 640,
                            // aspectRatio: 16 / 2,
                            scrollDirection: Axis.horizontal,
                            autoPlayInterval: Duration(seconds: 5),
                            enlargeCenterPage: true,
                            enlargeFactor: 0.5,
                            disableCenter: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex.value = 3;
                            },
                            child: Text(
                              'Login',
                              softWrap: true,
                              style: TextStyle(
                                  color: GlobalColors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                if (Responsive.isDesktop(context))
                  Flexible(
                      child: Container(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 20),
                      child: Column(
                        children: <Widget>[
                          textFiled(
                              keys: formKey,
                              label: "First Name",
                              hintText: "First Name",
                              suffixIcon2:
                                  const Icon(Icons.people_alt_outlined),
                              controller2: firstnameController,
                              keyboardType4: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                  return "Enter Your First Name";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey1,
                              label: "Last Name",
                              hintText: "Last Name",
                              suffixIcon2:
                                  const Icon(Icons.people_alt_outlined),
                              controller2: lastnameController,
                              keyboardType4: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                  return "Enter Your Last Name";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey2,
                              label: "Email",
                              hintText: "Email",
                              suffixIcon2: const Icon(Icons.email),
                              controller2: emailcontroller,
                              keyboardType4: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                        .hasMatch(value!)) {
                                  return "Enter Your email";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey3,
                              label: "Number",
                              hintText: "Number",
                              suffixIcon2: const Icon(Icons.numbers),
                              controller2: numberController,
                              keyboardType4: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                        .hasMatch(value!)) {
                                  return "Enter Your Number";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey4,
                              label: "PASSWORD",
                              hintText: "Password",
                              suffixIcon2: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off_outlined),
                                color: Colors.white,
                              ),
                              controller2: passwordcontroller,
                              obscureText: !_isVisible,
                              keyboardType4: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^.*$').hasMatch(value!)) {
                                  return "Enter Your Password";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey5,
                              label: "COMFIRMPASSWORD",
                              hintText: "ComfirmPassword",
                              obscureText: !_isVisible,
                              controller2: confirmpasswordController,
                              suffixIcon2: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off_outlined),
                                color: Colors.white,
                              ),
                              keyboardType4: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^.*$').hasMatch(value!)) {
                                  return "Enter Your ComfirmPassword";
                                } else if (passwordcontroller.text.isEmpty ||
                                    confirmpasswordController.text.isEmpty) {
                                  return 'Both fields are required.';
                                } else if (passwordcontroller.text !=
                                    confirmpasswordController.text) {
                                  return 'Passwords do not match.';
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex.value = 0;
                            },
                            child: Container(
                              width: 270,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                              child: Text(
                                'SignUp',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'or',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 270,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/PngItem_332868.png',
                                    height: 30,
                                    width: 40,
                                  ),
                                  Text(
                                    'SignUp with Gmail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )),
                if (Responsive.isTablet(context))
                  Flexible(
                      child: Column(
                    children: [
                      CarouselSlider(
                        items: contents
                            .map((e) => Column(
                                  children: [
                                    Image.asset(
                                      e.image,
                                      height: 500,
                                    ),
                                    Text(
                                      e.title,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                    ),
                                    Text(
                                      e.discription,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ))
                            .toList(),
                        options: CarouselOptions(
                            initialPage: 0,
                            viewportFraction: 1,
                            autoPlay: true,
                            height: 640,
                            // aspectRatio: 16 / 2,
                            scrollDirection: Axis.horizontal,
                            autoPlayInterval: Duration(seconds: 5),
                            enlargeCenterPage: true,
                            enlargeFactor: 0.5,
                            disableCenter: true),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex.value = 3;
                            },
                            child: Text(
                              'Login',
                              softWrap: true,
                              style: TextStyle(
                                  color: GlobalColors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                if (Responsive.isTablet(context))
                  Flexible(
                      child: Container(
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Create an account !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          textFiled(
                              keys: formKey,
                              label: "First Name",
                              hintText: "First Name",
                              suffixIcon2:
                                  const Icon(Icons.people_alt_outlined),
                              controller2: firstnameController,
                              keyboardType4: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                  return "Enter Your First Name";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey1,
                              label: "Last Name",
                              hintText: "Last Name",
                              suffixIcon2:
                                  const Icon(Icons.people_alt_outlined),
                              controller2: lastnameController,
                              keyboardType4: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                  return "Enter Your Last Name";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey2,
                              label: "Email",
                              hintText: "Email",
                              suffixIcon2: const Icon(Icons.email),
                              controller2: emailcontroller,
                              keyboardType4: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                        .hasMatch(value!)) {
                                  return "Enter Your email";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey3,
                              label: "Number",
                              hintText: "Number",
                              suffixIcon2: const Icon(Icons.numbers),
                              controller2: numberController,
                              keyboardType4: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                        .hasMatch(value!)) {
                                  return "Enter Your Number";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey4,
                              label: "PASSWORD",
                              hintText: "Password",
                              suffixIcon2: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off_outlined),
                                color: Colors.white,
                              ),
                              controller2: passwordcontroller,
                              obscureText: !_isVisible,
                              keyboardType4: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^.*$').hasMatch(value!)) {
                                  return "Enter Your Password";
                                } else {
                                  return null;
                                }
                              }),
                          textFiled(
                              keys: formKey5,
                              label: "COMFIRMPASSWORD",
                              hintText: "ComfirmPassword",
                              obscureText: !_isVisible,
                              controller2: confirmpasswordController,
                              suffixIcon2: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisible = !_isVisible;
                                  });
                                },
                                icon: _isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off_outlined),
                                color: Colors.white,
                              ),
                              keyboardType4: TextInputType.number,
                              validate: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^.*$').hasMatch(value!)) {
                                  return "Enter Your ComfirmPassword";
                                } else if (passwordcontroller.text.isEmpty ||
                                    confirmpasswordController.text.isEmpty) {
                                  return 'Both fields are required.';
                                } else if (passwordcontroller.text !=
                                    confirmpasswordController.text) {
                                  return 'Passwords do not match.';
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex.value = 0;
                            },
                            child: Container(
                              width: 270,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                              child: Text(
                                'SignUp',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'or',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 270,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/PngItem_332868.png',
                                    height: 30,
                                    width: 40,
                                  ),
                                  Text(
                                    'SignUp with Gmail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )),
                if (Responsive.isMobile(context))
                  Flexible(
                    child: CarouselSlider(
                      items: contents
                          .map((e) => Column(
                                children: [
                                  Image.asset(
                                    e.image,
                                    height: 150,
                                  ),
                                  Text(
                                    e.title,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16),
                                  ),
                                  Text(
                                    e.discription,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  )
                                ],
                              ))
                          .toList(),
                      options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          autoPlay: true,
                          height: 210,
                          // aspectRatio: 16 / 2,
                          scrollDirection: Axis.horizontal,
                          autoPlayInterval: Duration(seconds: 5),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.5,
                          disableCenter: true),
                    ),
                  )
              ],
            ),
            if (Responsive.isMobile(context))
              Container(
                width: 650,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Create an account !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      textFiled(
                          keys: formKey,
                          label: "First Name",
                          hintText: "First Name",
                          suffixIcon2: const Icon(Icons.people_alt_outlined),
                          controller2: firstnameController,
                          keyboardType4: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                              return "Enter Your First Name";
                            } else {
                              return null;
                            }
                          }),
                      textFiled(
                          keys: formKey1,
                          label: "Last Name",
                          hintText: "Last Name",
                          suffixIcon2: const Icon(Icons.people_alt_outlined),
                          controller2: lastnameController,
                          keyboardType4: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                              return "Enter Your Last Name";
                            } else {
                              return null;
                            }
                          }),
                      textFiled(
                          keys: formKey2,
                          label: "Email",
                          hintText: "Email",
                          suffixIcon2: const Icon(Icons.email),
                          controller2: emailcontroller,
                          keyboardType4: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value!)) {
                              return "Enter Your email";
                            } else {
                              return null;
                            }
                          }),
                      textFiled(
                          keys: formKey3,
                          label: "Number",
                          hintText: "Number",
                          suffixIcon2: const Icon(Icons.numbers),
                          controller2: numberController,
                          keyboardType4: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                    .hasMatch(value!)) {
                              return "Enter Your Number";
                            } else {
                              return null;
                            }
                          }),
                      textFiled(
                          keys: formKey4,
                          label: "PASSWORD",
                          hintText: "Password",
                          suffixIcon2: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off_outlined),
                            color: Colors.white,
                          ),
                          controller2: passwordcontroller,
                          obscureText: !_isVisible,
                          keyboardType4: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^.*$').hasMatch(value!)) {
                              return "Enter Your Password";
                            } else {
                              return null;
                            }
                          }),
                      textFiled(
                          keys: formKey5,
                          label: "COMFIRMPASSWORD",
                          hintText: "ComfirmPassword",
                          obscureText: !_isVisible,
                          controller2: confirmpasswordController,
                          suffixIcon2: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off_outlined),
                            color: Colors.white,
                          ),
                          keyboardType4: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^.*$').hasMatch(value!)) {
                              return "Enter Your ComfirmPassword";
                            } else if (passwordcontroller.text.isEmpty ||
                                confirmpasswordController.text.isEmpty) {
                              return 'Both fields are required.';
                            } else if (passwordcontroller.text !=
                                confirmpasswordController.text) {
                              return 'Passwords do not match.';
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectedIndex.value = 0;
                        },
                        child: Container(
                          width: 270,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(13),
                            ),
                          ),
                          child: Text(
                            'SignUp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'or',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 270,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(horizontal: 9),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(13),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/PngItem_332868.png',
                                height: 30,
                                width: 40,
                              ),
                              Text(
                                'SignUp with Gmail',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectedIndex.value = 3;
                            },
                            child: Text(
                              'Login',
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
