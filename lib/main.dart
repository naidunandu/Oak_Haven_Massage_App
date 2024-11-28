import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oak_haven_massage_app/routes/route_name.dart';
import 'package:oak_haven_massage_app/routes/route_methods.dart';
import 'package:oak_haven_massage_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (BuildContext context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: widget!,
        );
      },
      title: 'Oak Haven Massage App',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      getPages: AppRoutes.pages,
      initialRoute: RouteNames.splash,
    );
  }
}
