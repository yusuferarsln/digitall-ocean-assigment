import 'package:digital_ocean_app/localization/controller/languageController.dart';
import 'package:digital_ocean_app/ui/marine_location.dart';
import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:digital_ocean_app/ui/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LanguageController languageController = Get.put(LanguageController());

Widget drawerWidget(BuildContext context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: palleteLightBlue,
            ),
            child: Center(
              child: Text(
                'DigitALL Ocean',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Contracts'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'CRM'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Vessel'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Crew'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Marine'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {
              Get.to(MarineLocation());
            },
          ),
          ListTile(
            title: Text(
              'Settings'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              buildLanguageDialog(context);
            },
          ),
        ],
      ),
    );

buildLanguageDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Choose Your Language'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Text(locale[index]['name']),
                      onTap: () {
                        ChangeL(locale[index]['name'], context);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length),
          ),
        );
      });
}

void ChangeL(String localization, context) {
  localization == "English"
      ? languageController.changeLanguage('en', 'Us')
      : languageController.changeLanguage('tr', 'Tr');
  localization == "English"
      ? Get.snackbar('Success', 'App language is now English',
          snackPosition: SnackPosition.BOTTOM)
      : Get.snackbar('Başarılı', 'Uygulama dili artık Türkçe',
          snackPosition: SnackPosition.BOTTOM);
  Navigator.pop(context);
}

final List locale = [
  {'name': 'English', 'locale': Locale('en', 'US')},
  {'name': 'Türkçe', 'locale': Locale('tr', 'TR')},
];
