import 'package:cityfood/screens/uploadProduct.dart';
import 'package:cityfood/screens/profileScreen/notification.dart';
import 'package:cityfood/screens/profileScreen/userProfile.dart';
import 'package:cityfood/screens/wishList.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    UserProfilePage(),
    const UploadProductPage(),
    const NotificationPage(),
    const WishListPage(),
  ];
}
