import 'package:cityfood/screens/uploadProduct.dart';
import 'package:cityfood/screens/profileScreen/notification.dart';
import 'package:cityfood/screens/profileScreen/userProfile.dart';
import 'package:cityfood/screens/wishList.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screen = [
    UserProfilePage(),
    const UploadProductPage(),
    const NotificationPage(),
    const WishListPage(),
  ];
}
