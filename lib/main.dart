import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/bindings/home_binding.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Pixabay Gallery",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: HomeBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}
