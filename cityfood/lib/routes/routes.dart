import 'package:cityfood/screens/getAStore.dart';
import 'package:cityfood/screens/home.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/";
  static String getStore = "/getStore";

  static String getHomeRoute() => home;
  static String getStoreRoute() => getStore;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => MyHomePage()),
    GetPage(name: getStore, page: () => GetAStore())
  ];
}
