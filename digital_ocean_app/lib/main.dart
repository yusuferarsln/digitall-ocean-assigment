import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:digital_ocean_app/ui/view/home.dart';
import 'package:digital_ocean_app/ui/widgets/drawer_widget.dart';
import 'package:digital_ocean_app/localization/controller/languageController.dart';
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
        backgroundColor: palleteLightBlue,
        drawer: drawerWidget(context),
        appBar: AppBar(
          backgroundColor: palleteLightBlue,
          title: Text('Crew'.tr),
        ),
        body: HomePage());
  }
}
