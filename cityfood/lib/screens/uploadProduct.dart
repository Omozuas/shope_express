import 'dart:io';
import 'dart:typed_data';

import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/textField_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductPage extends StatefulWidget {
  const UploadProductPage({super.key});

  @override
  State<UploadProductPage> createState() => _UploadProductPageState();
}

class _UploadProductPageState extends State<UploadProductPage> {
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController describecontroller = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController brandontroller = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? dropdown = 'Select Cartegory';
  final ImagePicker imagePicker = ImagePicker();
  List<Map<String, dynamic>> images = [];

  void _imagesPicker() async {
    final List<XFile>? pickedImages = await imagePicker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      for (var image in pickedImages) {
        Uint8List bytes = await image.readAsBytes();
        String path = image.path;
        images.add({'bytes': bytes, 'path': path});
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 30),
            child: Text(
              "Upload your Product",
              style: TextStyle(
                  color: GlobalColors.orange,
                  fontSize: Responsive.isDesktop(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 25
                          : Responsive.isMobile(context)
                              ? 20
                              : 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Container(
                  child: InkWell(
                      onTap: () {
                        _imagesPicker();
                      },
                      splashColor: Colors.white,
                      child: DottedBorder(
                        strokeWidth: 2,
                        radius: const Radius.circular(19),
                        padding: const EdgeInsets.all(1),
                        dashPattern: const [13, 8, 13],
                        borderType: BorderType.RRect,
                        child: images.isEmpty
                            ? Container(
                                width: 322,
                                height: 183,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: GlobalColors.orange,
                                    ),
                                    color: Colors.lightBlue.shade100,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.cloudArrowUp,
                                        color: GlobalColors.ropeBrown,
                                        size: 86,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Browse file",
                                        style: TextStyle(
                                            color: GlobalColors.orange,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4, crossAxisSpacing: 3),
                                itemCount: images.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, index) {
                                  return SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.memory(
                                      images[index]['bytes'],
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                      )),
                )),
                Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 250,
                                child: textFiledProfile(
                                    keys: formKey,
                                    label: "Name Of Product",
                                    hintText: "Name Of Product".toLowerCase(),
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: titlecontroller,
                                    keyboardType4: TextInputType.name,
                                    validate: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
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
                                width: 250,
                                child: textFiledProfile(
                                    keys: formKey2,
                                    label: "price of product".toUpperCase(),
                                    hintText: "price of product".toLowerCase(),
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: priceController,
                                    keyboardType4: TextInputType.number,
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
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 250,
                                child: textFiledProfile(
                                    keys: formKey5,
                                    label: "number of product".toUpperCase(),
                                    hintText: "number of product".toLowerCase(),
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: quantityController,
                                    keyboardType4: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Your Last Name";
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 250,
                                child: textFiledProfile(
                                    keys: formKey3,
                                    label: "brand of product",
                                    hintText: "brand of product",
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: brandontroller,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 450,
                                child: DropdownButtonFormField(
                                  borderRadius: BorderRadius.circular(10),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 36,
                                  elevation: 0,
                                  isExpanded: true,
                                  focusColor: Colors.black54,
                                  dropdownColor: Colors.grey[200],
                                  onChanged: (String? nwvalue) {
                                    setState(() {
                                      dropdown = nwvalue;
                                      print(nwvalue);
                                    });
                                  },
                                  value: dropdown,
                                  items: const [
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Select Cartegory',
                                        child: Text('Select Cartegory',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Electronics',
                                        child: Text('Electronics',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Mobile Phones',
                                        child: Text('Mobile Phones',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Computers & Tablets',
                                        child: Text('Computers & Tablets',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Audio',
                                        child: Text('Audio',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Cameras & Photography',
                                        child: Text('Cameras & Photography',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Televisions',
                                        child: Text('Televisions',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Fashion',
                                        child: Text('Fashion',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: "Men's Fashion",
                                        child: Text("Men's Fashion",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: "Women's Fashion",
                                        child: Text("Women's Fashion",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: "Kids' Fashion",
                                        child: Text("Kids' Fashion",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Home & Kitchen',
                                        child: Text('Home & Kitchen',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Furniture',
                                        child: Text('Furniture',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Kitchen Appliances',
                                        child: Text('Kitchen Appliances',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Cookware & Dining',
                                        child: Text('Cookware & Dining',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Skincare',
                                        child: Text('Skincare',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Haircare',
                                        child: Text('Haircare',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Makeup',
                                        child: Text('Makeup',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Supplements',
                                        child: Text('Supplements',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Fitness Equipment',
                                        child: Text('Fitness Equipment',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Personal Care',
                                        child: Text('Personal Care',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Sports Equipment',
                                        child: Text('Sports Equipment',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Outdoor Gear',
                                        child: Text('Outdoor Gear',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Toys',
                                        child: Text('Toys',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Games',
                                        child: Text('Games',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Action Figures',
                                        child: Text('Action Figures',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Educational Toys',
                                        child: Text('Educational Toys',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Board Games',
                                        child: Text('Board Games',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Video Games',
                                        child: Text('Video Games',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Books',
                                        child: Text('Books',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Music',
                                        child: Text('Music',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Movies',
                                        child: Text('Movies',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Car Electronics',
                                        child: Text('Car Electronics',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Car Accessories',
                                        child: Text('Car Accessories',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Motorcycle Accessories',
                                        child: Text('Motorcycle Accessories',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Office Supplies',
                                        child: Text('Office Supplies',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Office Electronics',
                                        child: Text('Office Electronics',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Pet Supplies',
                                        child: Text('Pet Supplies',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Baby Products',
                                        child: Text('Baby Products',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Grocery',
                                        child: Text('Grocery',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Holiday Specials',
                                        child: Text('Holiday Specials',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                    DropdownMenuItem<String>(
                                        alignment: Alignment.center,
                                        value: 'Sales & Discounts',
                                        child: Text('Sales & Discounts',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 900,
                            child: textFiledProfile(
                                keys: formKey1,
                                maxLines: 15,
                                label: "discription".toUpperCase(),
                                hintText: "discription".toLowerCase(),
                                suffixIcon2: Icon(Icons.people_alt_outlined,
                                    color: GlobalColors.orange),
                                controller2: describecontroller,
                                keyboardType4: TextInputType.name,
                                validate: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value!)) {
                                    return "Enter Your Last Name";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              // print({
                              //   "mobile": numberController.text,
                              //   "email": emailcontroller.text,
                              //   "firstnmae": firstnameController.text,
                              //   "lastname": lastnameController.text
                              // });
                              // updateAUser();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              height: 50,
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              decoration: BoxDecoration(
                                  color: GlobalColors.orange,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          if (Responsive.isTablet(context))
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textFiledProfile(
                      keys: formKey,
                      label: "Name Of Product",
                      hintText: "Name Of Product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: titlecontroller,
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
                      keys: formKey2,
                      label: "price of product".toUpperCase(),
                      hintText: "price of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: priceController,
                      keyboardType4: TextInputType.number,
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
                      keys: formKey5,
                      label: "number of product".toUpperCase(),
                      hintText: "number of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: quantityController,
                      keyboardType4: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your Last Name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  textFiledProfile(
                      keys: formKey3,
                      label: "brand of product",
                      hintText: "brand of product",
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: brandontroller,
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
                  SizedBox(
                    width: 450,
                    child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(10),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 36,
                      elevation: 0,
                      isExpanded: true,
                      focusColor: Colors.black54,
                      dropdownColor: Colors.grey[200],
                      onChanged: (String? nwvalue) {
                        setState(() {
                          dropdown = nwvalue;
                          print(nwvalue);
                        });
                      },
                      value: dropdown,
                      items: const [
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Select Cartegory',
                            child: Text('Select Cartegory',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Electronics',
                            child: Text('Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Mobile Phones',
                            child: Text('Mobile Phones',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Computers & Tablets',
                            child: Text('Computers & Tablets',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Audio',
                            child: Text('Audio',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Cameras & Photography',
                            child: Text('Cameras & Photography',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Televisions',
                            child: Text('Televisions',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Fashion',
                            child: Text('Fashion',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Men's Fashion",
                            child: Text("Men's Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Women's Fashion",
                            child: Text("Women's Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Kids' Fashion",
                            child: Text("Kids' Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Home & Kitchen',
                            child: Text('Home & Kitchen',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Furniture',
                            child: Text('Furniture',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Kitchen Appliances',
                            child: Text('Kitchen Appliances',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Cookware & Dining',
                            child: Text('Cookware & Dining',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Skincare',
                            child: Text('Skincare',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Haircare',
                            child: Text('Haircare',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Makeup',
                            child: Text('Makeup',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Supplements',
                            child: Text('Supplements',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Fitness Equipment',
                            child: Text('Fitness Equipment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Personal Care',
                            child: Text('Personal Care',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Sports Equipment',
                            child: Text('Sports Equipment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Outdoor Gear',
                            child: Text('Outdoor Gear',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Toys',
                            child: Text('Toys',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Games',
                            child: Text('Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Action Figures',
                            child: Text('Action Figures',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Educational Toys',
                            child: Text('Educational Toys',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Board Games',
                            child: Text('Board Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Video Games',
                            child: Text('Video Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Books',
                            child: Text('Books',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Music',
                            child: Text('Music',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Movies',
                            child: Text('Movies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Car Electronics',
                            child: Text('Car Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Car Accessories',
                            child: Text('Car Accessories',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Motorcycle Accessories',
                            child: Text('Motorcycle Accessories',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Office Supplies',
                            child: Text('Office Supplies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Office Electronics',
                            child: Text('Office Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Pet Supplies',
                            child: Text('Pet Supplies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Baby Products',
                            child: Text('Baby Products',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Grocery',
                            child: Text('Grocery',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Holiday Specials',
                            child: Text('Holiday Specials',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Sales & Discounts',
                            child: Text('Sales & Discounts',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: InkWell(
                        onTap: () {
                          _imagesPicker();
                        },
                        splashColor: Colors.white,
                        child: DottedBorder(
                          strokeWidth: 2,
                          radius: const Radius.circular(19),
                          padding: const EdgeInsets.all(1),
                          dashPattern: const [13, 8, 13],
                          borderType: BorderType.RRect,
                          child: images.isEmpty
                              ? Container(
                                  // width: 322,
                                  // height: 183,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: GlobalColors.orange,
                                      ),
                                      color: Colors.lightBlue.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.cloudArrowUp,
                                          color: GlobalColors.ropeBrown,
                                          size: 86,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Browse file",
                                          style: TextStyle(
                                              color: GlobalColors.orange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 3),
                                  itemCount: images.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.memory(
                                        images[index]['bytes'],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textFiledProfile(
                      keys: formKey1,
                      maxLines: 15,
                      label: "discription".toUpperCase(),
                      hintText: "discription".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: describecontroller,
                      keyboardType4: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your Last Name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // print({
                      //   "mobile": numberController.text,
                      //   "email": emailcontroller.text,
                      //   "firstnmae": firstnameController.text,
                      //   "lastname": lastnameController.text
                      // });
                      // updateAUser();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 50,
                      child: Text(
                        "Upload",
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFiledProfile(
                      keys: formKey,
                      label: "Name Of Product",
                      hintText: "Name Of Product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: titlecontroller,
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
                      keys: formKey2,
                      label: "price of product".toUpperCase(),
                      hintText: "price of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: priceController,
                      keyboardType4: TextInputType.number,
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
                      keys: formKey5,
                      label: "number of product".toUpperCase(),
                      hintText: "number of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: quantityController,
                      keyboardType4: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your Last Name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  textFiledProfile(
                      keys: formKey3,
                      label: "brand of product",
                      hintText: "brand of product",
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: brandontroller,
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
                  SizedBox(
                    width: 450,
                    child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(10),
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 36,
                      elevation: 0,
                      isExpanded: true,
                      focusColor: Colors.black54,
                      dropdownColor: Colors.grey[200],
                      onChanged: (String? nwvalue) {
                        setState(() {
                          dropdown = nwvalue;
                          print(nwvalue);
                        });
                      },
                      value: dropdown,
                      items: const [
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Select Cartegory',
                            child: Text('Select Cartegory',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Electronics',
                            child: Text('Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Mobile Phones',
                            child: Text('Mobile Phones',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Computers & Tablets',
                            child: Text('Computers & Tablets',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Audio',
                            child: Text('Audio',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Cameras & Photography',
                            child: Text('Cameras & Photography',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Televisions',
                            child: Text('Televisions',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Fashion',
                            child: Text('Fashion',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Men's Fashion",
                            child: Text("Men's Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Women's Fashion",
                            child: Text("Women's Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: "Kids' Fashion",
                            child: Text("Kids' Fashion",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Home & Kitchen',
                            child: Text('Home & Kitchen',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Furniture',
                            child: Text('Furniture',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Kitchen Appliances',
                            child: Text('Kitchen Appliances',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Cookware & Dining',
                            child: Text('Cookware & Dining',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Skincare',
                            child: Text('Skincare',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Haircare',
                            child: Text('Haircare',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Makeup',
                            child: Text('Makeup',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Supplements',
                            child: Text('Supplements',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Fitness Equipment',
                            child: Text('Fitness Equipment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Personal Care',
                            child: Text('Personal Care',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Sports Equipment',
                            child: Text('Sports Equipment',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Outdoor Gear',
                            child: Text('Outdoor Gear',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Toys',
                            child: Text('Toys',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Games',
                            child: Text('Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Action Figures',
                            child: Text('Action Figures',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Educational Toys',
                            child: Text('Educational Toys',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Board Games',
                            child: Text('Board Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Video Games',
                            child: Text('Video Games',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Books',
                            child: Text('Books',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Music',
                            child: Text('Music',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Movies',
                            child: Text('Movies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Car Electronics',
                            child: Text('Car Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Car Accessories',
                            child: Text('Car Accessories',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Motorcycle Accessories',
                            child: Text('Motorcycle Accessories',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Office Supplies',
                            child: Text('Office Supplies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Office Electronics',
                            child: Text('Office Electronics',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Pet Supplies',
                            child: Text('Pet Supplies',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Baby Products',
                            child: Text('Baby Products',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Grocery',
                            child: Text('Grocery',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Holiday Specials',
                            child: Text('Holiday Specials',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                        DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: 'Sales & Discounts',
                            child: Text('Sales & Discounts',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: InkWell(
                        onTap: () {
                          _imagesPicker();
                        },
                        splashColor: Colors.white,
                        child: DottedBorder(
                          strokeWidth: 2,
                          radius: const Radius.circular(19),
                          padding: const EdgeInsets.all(1),
                          dashPattern: const [13, 8, 13],
                          borderType: BorderType.RRect,
                          child: images.isEmpty
                              ? Container(
                                  // width: 322,
                                  // height: 183,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: GlobalColors.orange,
                                      ),
                                      color: Colors.lightBlue.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.cloudArrowUp,
                                          color: GlobalColors.ropeBrown,
                                          size: 86,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Browse file",
                                          style: TextStyle(
                                              color: GlobalColors.orange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 3),
                                  itemCount: images.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.memory(
                                        images[index]['bytes'],
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textFiledProfile(
                      keys: formKey1,
                      maxLines: 15,
                      label: "discription".toUpperCase(),
                      hintText: "discription".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: describecontroller,
                      keyboardType4: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your Last Name";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      // print({
                      //   "mobile": numberController.text,
                      //   "email": emailcontroller.text,
                      //   "firstnmae": firstnameController.text,
                      //   "lastname": lastnameController.text
                      // });
                      // updateAUser();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 50,
                      child: Text(
                        "Upload",
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
