import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/routes/routes.dart';
import 'package:cityfood/screens/home.dart';
import 'package:cityfood/theme/darkTheme.dart';
import 'package:cityfood/theme/lightTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          initialRoute: RoutesClass.getHomeRoute(),
          getPages: RoutesClass.routes,
        ));
  }
}
