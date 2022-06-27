import 'package:digital_ocean_app/home.dart';
import 'package:digital_ocean_app/localization/drawer_widget.dart';
import 'package:digital_ocean_app/localization/languageController.dart';
import 'package:digital_ocean_app/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    translations: Localization(),
    locale: Locale('en', 'Us'),
    fallbackLocale: Locale('en', 'Us'),
    title: 'Material App',
    home: MyApp()));

class MyApp extends StatelessWidget {
  LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerWidget(context),
        appBar: AppBar(
          title: Text('hello'.tr),
        ),
        body: HomePage());
  }
}
