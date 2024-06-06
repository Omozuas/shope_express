import 'package:cityfood/screens/cart.dart';
import 'package:cityfood/screens/getAStore.dart';
import 'package:cityfood/screens/home.dart';
import 'package:cityfood/screens/pagess.dart';
import 'package:cityfood/screens/profile.dart';
import 'package:cityfood/screens/profileScreen/userProfile.dart';
import 'package:cityfood/screens/view/login.dart';
import 'package:cityfood/screens/view/signUp.dart';
import 'package:cityfood/screens/wishList.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    ProfilePage(),
    MyHomePage(),
    GetAStore(),
    SignUpPage(),
    LoginPage(),
    // ProfilePage(),
    CartPage(),
    WishListPage(),
    Pagessss()
  ];
}
