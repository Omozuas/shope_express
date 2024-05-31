import 'package:cityfood/controller/controller.dart';
import 'package:cityfood/services/Apis/auth_api/user_controller.dart';
import 'package:cityfood/theme/darkTheme.dart';
import 'package:cityfood/theme/lightTheme.dart';
import 'package:cityfood/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProviderApi(),
          ),
          ChangeNotifierProvider(
            create: (_) => MenuAppController(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: FlexAppBar(),
          // initialRoute: RoutesClass.getHomeRoute(),
          // getPages: RoutesClass.routes,
        ));
  }
}
