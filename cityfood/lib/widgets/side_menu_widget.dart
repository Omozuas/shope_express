// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cityfood/widgets/appbarname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Drawer(
      width: 200,
      backgroundColor: Color.fromARGB(255, 242, 164, 62),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20),
            child: Text(
              'Shop Express',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DrawerListTile(
                      title: "Home",
                      iconData: Icons.home,
                      press: () => controller.selectedIndex.value = 0,
                      size: 20,
                      textColor: controller.selectedIndex.value == 0
                          ? Colors.white
                          : Colors.black,
                      color: controller.selectedIndex.value == 0
                          ? Colors.white
                          : Colors.black,
                    ),
                    DrawerListTile(
                      title: "ABOUT",
                      iconData: Icons.info_outline_rounded,
                      press: () {},
                      size: 20,
                      textColor: Colors.black,
                      color: Colors.black,
                    ),
                    DrawerListTile(
                      title: "FAQ",
                      iconData: Icons.question_mark_outlined,
                      press: () {},
                      size: 20,
                      textColor: Colors.black,
                      color: Colors.black,
                    ),
                    DrawerListTile(
                      title: "Get a Store",
                      iconData: Icons.store,
                      press: () => controller.selectedIndex.value = 1,
                      size: 20,
                      textColor: controller.selectedIndex.value == 1
                          ? Colors.white
                          : Colors.black,
                      color: controller.selectedIndex.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                    DrawerListTile(
                      title: "SignUp",
                      iconData: Icons.app_registration_sharp,
                      press: () => controller.selectedIndex.value = 2,
                      size: 20,
                      textColor: controller.selectedIndex.value == 2
                          ? Colors.white
                          : Colors.black,
                      color: controller.selectedIndex.value == 2
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    required this.iconData,
    required this.size,
    required this.textColor,
    required this.color,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData iconData;
  final double size;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        size: size,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
