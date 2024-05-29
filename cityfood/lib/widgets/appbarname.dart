import 'package:cityfood/screens/getAStore.dart';
import 'package:cityfood/screens/home.dart';
import 'package:cityfood/screens/view/login.dart';
import 'package:cityfood/screens/view/signUp.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [SignUpPage(), MyHomePage(), GetAStore(), LoginPage()];
}
