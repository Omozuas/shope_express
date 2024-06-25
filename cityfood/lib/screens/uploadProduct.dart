import 'dart:io';
import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/services/Apis/category_api/categoryApi.dart';
import 'package:cityfood/services/Apis/product_api/productApi.dart';
import 'package:cityfood/services/Apis/sub_category_api/sub_category_api.dart';
import 'package:cityfood/services/models/providers/category_provider.dart';
import 'package:cityfood/services/models/providers/sub_category_provider.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/profileController.dart';
import 'package:cityfood/widgets/snackBarRes.dart';
import 'package:cityfood/widgets/textField_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Categorymodel? dropdown;
  SubCategorymodel? dropdown2;
  List<Map<String, dynamic>> images = [];
  List<File> images1 = [];
  String path = '';
  late Uint8List bytes;
  List<Categorymodel> _categoryModel = [];
  List<SubCategorymodel> _subCategoryModel = [];

  Future<void> _imagesPicker() async {
    if (Responsive.isDesktop(context)) {
      print("web");
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );

      if (filePickerResult != null) {
        for (var image in filePickerResult.files) {
          path = image.name;
          bytes = image.bytes!;
          images.add({"bytes": image.bytes, "path": path});
          images1.add(File(image.name));
          setState(() {
            path = filePickerResult.files.first.name;
            bytes = filePickerResult.files.first.bytes!;
          });
          print(images1);
        }
      }
    } else {
      try {
        final ImagePicker imagePicker = ImagePicker();
        final pickedFile =
            await imagePicker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          String path = pickedFile.name;
          Uint8List bytes = await pickedFile.readAsBytes();
          images.add({"bytes": bytes, "path": path});
          images1.add(File(pickedFile.path));
          setState(() {
            path = pickedFile.name;
            bytes = bytes;
          });
        }
      } on PlatformException catch (e) {
        print("Failed to pick image: $e");
      }
    }
  }

  void uploadProducts() async {
    if (dropdown == 'Select Cartegory') {
      error(context: context, message: "Select Cartegory");
    } else if (images1.isEmpty) {
      error(context: context, message: "Select product images");
    } else if (formKey.currentState!.validate() &&
        formKey1.currentState!.validate() &&
        formKey2.currentState!.validate() &&
        formKey3.currentState!.validate() &&
        formKey4.currentState!.validate()) {
      final creatPrpduct =
          Provider.of<ProductProviderApi>(context, listen: false);
      final preferences = await SharedPreferences.getInstance();

      List<MapEntry<String, String>> formData = FormData({
        "title": titlecontroller.text,
        "description": describecontroller.text,
        "price": priceController.text,
        "brand": brandontroller.text,
        "quantity": quantityController.text,
        "category": dropdown!.id
      }).fields;

      creatPrpduct
          .createUser(preferences.getString('token')!, formData, images)
          .then((value) {
        if (value.success == true) {
          success(context: context, message: value.message);
          final controller = Get.put(ProfileController());
          controller.selectedIndex.value = 1;
        } else {
          error(context: context, message: value.message);
        }
      });
    } else {
      error(context: context, message: "complete details");
    }
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    getAllCategory();
  }

  void getAllCategory() async {
    final preferences = await SharedPreferences.getInstance();
    final get = Provider.of<CategoryProviderApi>(context, listen: false);
    get.getAllCategory(preferences.getString('token')!).then((value) {
      setState(() {
        _categoryModel = value;
      });
    });
  }

  void getAllSubCategory() async {
    final preferences = await SharedPreferences.getInstance();
    final get = Provider.of<SubCategoryProviderApi>(context, listen: false);
    get.getAllSubCategory(preferences.getString('token')!).then((value) {
      setState(() {
        _subCategoryModel = value;
      });
    });
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
                    child: GestureDetector(
                        onTap: () {
                          _imagesPicker();
                        },
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
                        ))),
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
                                        return "Enter Your Name Of Product";
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
                                    keys: formKey1,
                                    label: "price of product".toUpperCase(),
                                    hintText: "price of product".toLowerCase(),
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: priceController,
                                    keyboardType4: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                              .hasMatch(value!)) {
                                        return "Enter price of product";
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
                                    keys: formKey2,
                                    label: "number of product".toUpperCase(),
                                    hintText: "number of product".toLowerCase(),
                                    suffixIcon2: Icon(Icons.people_alt_outlined,
                                        color: GlobalColors.orange),
                                    controller2: quantityController,
                                    keyboardType4: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Your number of product";
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
                                          !RegExp(r'^[a-z A-Z]+$')
                                              .hasMatch(value!)) {
                                        return "Enter Your brand of product";
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
                                child: DropdownButtonFormField<Categorymodel>(
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    iconSize: 36,
                                    hint: const Text(
                                      'Select Category',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    elevation: 0,
                                    isExpanded: true,
                                    focusColor: Colors.black54,
                                    dropdownColor: Colors.grey[200],
                                    onChanged: (Categorymodel? nwvalue) {
                                      setState(() {
                                        dropdown = nwvalue;
                                      });
                                    },
                                    value: dropdown,
                                    items: _categoryModel.map((item) {
                                      return DropdownMenuItem<Categorymodel>(
                                          alignment: Alignment.center,
                                          value: item,
                                          child: Text(item.title,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black)));
                                    }).toList()),
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
                                keys: formKey4,
                                maxLines: 15,
                                label: "description".toUpperCase(),
                                hintText: "description".toLowerCase(),
                                suffixIcon2: Icon(Icons.people_alt_outlined,
                                    color: GlobalColors.orange),
                                controller2: describecontroller,
                                keyboardType4: TextInputType.name,
                                validate: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-z A-Z]+$')
                                          .hasMatch(value!)) {
                                    return "Enter Your product description";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              uploadProducts();
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
                          return "Enter Your Name Of Product";
                        } else {
                          return null;
                        }
                      }),
                  textFiledProfile(
                      keys: formKey1,
                      label: "price of product".toUpperCase(),
                      hintText: "price of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: priceController,
                      keyboardType4: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value!)) {
                          return "price of product";
                        } else {
                          return null;
                        }
                      }),
                  textFiledProfile(
                      keys: formKey2,
                      label: "number of product".toUpperCase(),
                      hintText: "number of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: quantityController,
                      keyboardType4: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value!)) {
                          return "Enter the number of product";
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
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter brand of product";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 450,
                    child: DropdownButtonFormField<Categorymodel>(
                        borderRadius: BorderRadius.circular(10),
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 36,
                        elevation: 0,
                        isExpanded: true,
                        focusColor: Colors.black54,
                        dropdownColor: Colors.grey[200],
                        onChanged: (Categorymodel? nwvalue) {
                          setState(() {
                            dropdown = nwvalue;
                          });
                        },
                        value: dropdown,
                        items: _categoryModel.map((item) {
                          return DropdownMenuItem<Categorymodel>(
                              alignment: Alignment.center,
                              value: item,
                              child: Text('${item.title}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)));
                        }).toList()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        _imagesPicker();
                      },
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
                  SizedBox(
                    height: 30,
                  ),
                  textFiledProfile(
                      keys: formKey4,
                      maxLines: 15,
                      label: "description".toUpperCase(),
                      hintText: "description".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: describecontroller,
                      keyboardType4: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your product description";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadProducts();
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
                          return "Enter Your Name Of Product";
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
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value!)) {
                          return "Enter Your price of product";
                        } else {
                          return null;
                        }
                      }),
                  textFiledProfile(
                      keys: formKey3,
                      label: "number of product".toUpperCase(),
                      hintText: "number of product".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: quantityController,
                      keyboardType4: TextInputType.number,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                                .hasMatch(value!)) {
                          return "Enter Your number of product";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  textFiledProfile(
                      keys: formKey4,
                      label: "brand of product",
                      hintText: "brand of product",
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: brandontroller,
                      keyboardType4: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your brand of product";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 450,
                    child: DropdownButtonFormField<Categorymodel>(
                        borderRadius: BorderRadius.circular(10),
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 36,
                        elevation: 0,
                        isExpanded: true,
                        focusColor: Colors.black54,
                        dropdownColor: Colors.grey[200],
                        onChanged: (Categorymodel? nwvalue) {
                          setState(() {
                            dropdown = nwvalue;
                          });
                        },
                        value: dropdown,
                        items: _categoryModel.map((item) {
                          return DropdownMenuItem<Categorymodel>(
                              alignment: Alignment.center,
                              value: item,
                              child: Text('${item.title}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)));
                        }).toList()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      onTap: () {
                        _imagesPicker();
                      },
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
                  SizedBox(
                    height: 30,
                  ),
                  textFiledProfile(
                      keys: formKey1,
                      maxLines: 15,
                      label: "description".toUpperCase(),
                      hintText: "description".toLowerCase(),
                      suffixIcon2: Icon(Icons.people_alt_outlined,
                          color: GlobalColors.orange),
                      controller2: describecontroller,
                      keyboardType4: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                          return "Enter Your product description";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadProducts();
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
