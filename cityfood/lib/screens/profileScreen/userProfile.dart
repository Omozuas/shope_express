import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/appbarname.dart';
import 'package:cityfood/widgets/snackBarRes.dart';
import 'package:cityfood/widgets/textField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/Apis/auth_api/user_controller.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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
  String firstname = '';
  String lastname = '';
  String address = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getaUser();
  }

  void getaUser() async {
    final controller = Get.put(NavigationController());
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      controller.selectedIndex.value = 3;
    } else {
      final getInfo = Provider.of<UserProviderApi>(context, listen: false);
      getInfo.getUser(prefs.getString('token')!).then((value) {
        firstnameController.text = value.firstname;
        lastnameController.text = value.lastname;
        numberController.text = value.mobile;
        emailcontroller.text = value.email;
        setState(() {
          firstname = value.firstname;
          lastname = value.lastname;
          // address = value.address;
        });
      });
    }
  }

  void updateAUser() async {
    final controller = Get.put(NavigationController());
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      controller.selectedIndex.value = 3;
    } else {
      final getInfo = Provider.of<UserProviderApi>(context, listen: false);
      getInfo
          .updateUser(
              firstnameController.text,
              lastnameController.text,
              emailcontroller.text,
              numberController.text,
              prefs.getString('token')!)
          .then((value) {
        if (value.success == true) {
          success(
            context: context,
            message: value.message,
          );
        } else {
          error(context: context, message: value.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isDesktop(context))
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditProfilePic(
                    width: 150,
                    height: 150,
                    circleZize: 100,
                    image: AssetImage('assets/images/Image.png'),
                    onTap: () {},
                    firstname: "$firstname",
                    lastname: "$lastname",
                    address: "Idimu ,Lagos State",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: textFiledProfile(
                            keys: formKey,
                            label: "First Name",
                            hintText: "First Name",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
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
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        width: 300,
                        child: textFiledProfile(
                            keys: formKey1,
                            label: "Last Name",
                            hintText: "Last Name",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: textFiledProfile(
                            keys: formKey2,
                            label: "Email",
                            hintText: "Email",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
                            controller2: emailcontroller,
                            keyboardType4: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value!)) {
                                return "Enter Your email";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        width: 300,
                        child: textFiledProfile(
                            keys: formKey3,
                            label: "Mobile",
                            hintText: "Mobile",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
                            controller2: numberController,
                            keyboardType4: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                      .hasMatch(value!)) {
                                return "Enter Your Number";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        if (Responsive.isDesktop(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  print({
                    "mobile": numberController.text,
                    "email": emailcontroller.text,
                    "firstnmae": firstnameController.text,
                    "lastname": lastnameController.text
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 50,
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  decoration: BoxDecoration(
                      color: GlobalColors.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ],
          ),
        if (Responsive.isTablet(context))
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditProfilePic(
                    width: 130,
                    height: 130,
                    circleZize: 100,
                    image: AssetImage('assets/images/Image.png'),
                    onTap: () {},
                    firstname: "$firstname",
                    lastname: "$lastname",
                    address: "Idimu ,Lagos State",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 230,
                        child: textFiledProfile(
                            keys: formKey,
                            label: "First Name",
                            hintText: "First Name",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
                            controller2: lastnameController,
                            keyboardType4: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                                return "Enter Your First Name";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 230,
                        child: textFiledProfile(
                            keys: formKey1,
                            label: "Last Name",
                            hintText: "Last Name",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 230,
                        child: textFiledProfile(
                            keys: formKey2,
                            label: "Email",
                            hintText: "Email",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
                            controller2: emailcontroller,
                            keyboardType4: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value!)) {
                                return "Enter Your email";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 230,
                        child: textFiledProfile(
                            keys: formKey3,
                            label: "Mobile",
                            hintText: "Mobile",
                            suffixIcon2: Icon(Icons.people_alt_outlined,
                                color: GlobalColors.orange),
                            controller2: numberController,
                            keyboardType4: TextInputType.name,
                            validate: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                      .hasMatch(value!)) {
                                return "Enter Your Number";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        if (Responsive.isTablet(context))
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 50,
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  decoration: BoxDecoration(
                      color: GlobalColors.orange,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
            ],
          ),
        if (Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.only(right: 10.0, bottom: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EditProfilePic(
                  width: 135,
                  height: 135,
                  circleZize: 100,
                  image: AssetImage('assets/images/Image.png'),
                  onTap: () {},
                  firstname: "$firstname",
                  lastname: "$lastname",
                  address: "Idimu ,Lagos State",
                ),
                SizedBox(
                  height: 40,
                ),
                textFiledProfile(
                    keys: formKey,
                    label: "First Name",
                    hintText: "First Name",
                    suffixIcon2: Icon(Icons.people_alt_outlined,
                        color: GlobalColors.orange),
                    controller2: lastnameController,
                    keyboardType4: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                        return "Enter Your First Name";
                      } else {
                        return null;
                      }
                    }),
                textFiledProfile(
                    keys: formKey1,
                    label: "Last Name",
                    hintText: "Last Name",
                    suffixIcon2: Icon(Icons.people_alt_outlined,
                        color: GlobalColors.orange),
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
                textFiledProfile(
                    keys: formKey2,
                    label: "Email",
                    hintText: "Email",
                    suffixIcon2:
                        Icon(Icons.email_outlined, color: GlobalColors.orange),
                    controller2: emailcontroller,
                    keyboardType4: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value!)) {
                        return "Enter Your email";
                      } else {
                        return null;
                      }
                    }),
                textFiledProfile(
                    keys: formKey3,
                    label: "Mobile",
                    hintText: "Mobile",
                    suffixIcon2:
                        Icon(Icons.numbers_sharp, color: GlobalColors.orange),
                    controller2: numberController,
                    keyboardType4: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                              .hasMatch(value!)) {
                        return "Enter Your Number";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 50,
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    decoration: BoxDecoration(
                        color: GlobalColors.orange,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ignore: must_be_immutable
class EditProfilePic extends StatelessWidget {
  EditProfilePic(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      required this.circleZize,
      this.firstname,
      this.lastname,
      this.address,
      required this.onTap});
  double width;
  double height;
  ImageProvider image;
  double circleZize;
  VoidCallback onTap;
  String? firstname, lastname, address;
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                ProfileImage(
                  width: width,
                  height: height,
                  image: image,
                  circleZize: circleZize,
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        CupertinoIcons.pencil,
                        color: Colors.white,
                        size: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        color: GlobalColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "$firstname $lastname",
                softWrap: true,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$address",
                softWrap: true,
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              )
            ],
          )
        : Row(
            children: [
              Stack(children: [
                ProfileImage(
                  width: width,
                  height: height,
                  image: image,
                  circleZize: circleZize,
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: InkWell(
                    onTap: onTap,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        CupertinoIcons.pencil,
                        color: Colors.white,
                        size: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        color: GlobalColors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$firstname $lastname",
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "$address",
                    softWrap: true,
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          );
  }
}

// ignore: must_be_immutable
class ProfileImage extends StatelessWidget {
  ProfileImage({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.circleZize,
  });
  double width;
  double height;
  ImageProvider image;
  double circleZize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(circleZize),
          image: DecorationImage(image: image, fit: BoxFit.cover)),
    );
  }
}
