import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:cityfood/util/responsive.dart';
import 'package:cityfood/widgets/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: Responsive.isDesktop(context)
                    ? 130
                    : Responsive.isTablet(context)
                        ? 130
                        : Responsive.isMobile(context)
                            ? 70
                            : 130,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Obx(
                  () => Column(
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
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? 200
                              : Responsive.isTablet(context)
                                  ? 160
                                  : Responsive.isMobile(context)
                                      ? 50
                                      : 200,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: _isHovering[0]
                                ? GlobalColors.orange
                                : controller.selectedIndex.value == 0
                                    ? GlobalColors.orange
                                    : Colors.grey[200],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: _isHovering[0]
                                    ? Colors.grey[200]
                                    : controller.selectedIndex.value == 0
                                        ? Colors.grey[200]
                                        : Colors.black,
                              ),
                              if (Responsive.isDesktop(context))
                                Text(
                                  'User Detail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: _isHovering[0]
                                          ? Colors.grey[200]
                                          : controller.selectedIndex.value == 0
                                              ? Colors.grey[200]
                                              : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              if (Responsive.isTablet(context))
                                Text(
                                  'User Detail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: _isHovering[0]
                                          ? Colors.grey[200]
                                          : controller.selectedIndex.value == 0
                                              ? Colors.grey[200]
                                              : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () => controller.selectedIndex.value = 1,
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? 200
                              : Responsive.isTablet(context)
                                  ? 160
                                  : Responsive.isMobile(context)
                                      ? 200
                                      : 200,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: _isHovering[1]
                                ? GlobalColors.orange
                                : controller.selectedIndex.value == 1
                                    ? GlobalColors.orange
                                    : Colors.grey[200],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload_outlined,
                                color: _isHovering[1]
                                    ? Colors.grey[200]
                                    : controller.selectedIndex.value == 1
                                        ? Colors.grey[200]
                                        : Colors.black,
                              ),
                              if (Responsive.isDesktop(context))
                                Text(
                                  'upload',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: _isHovering[1]
                                          ? Colors.grey[200]
                                          : controller.selectedIndex.value == 1
                                              ? Colors.grey[200]
                                              : Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              if (Responsive.isTablet(context))
                                Text(
                                  'upload',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: _isHovering[1]
                                          ? Colors.grey[200]
                                          : controller.selectedIndex.value == 1
                                              ? Colors.grey[200]
                                              : Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Flexible(
              child:
                  Obx(() => controller.screen[controller.selectedIndex.value]))
        ],
      ),
    );
  }
}
