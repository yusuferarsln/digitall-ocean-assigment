import 'package:digital_ocean_app/localization/languageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LanguageController languageController = Get.put(LanguageController());

Widget drawerWidget(BuildContext context) => Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
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
            title: Text('Contracts'.tr),
            onTap: () {},
          ),
          ListTile(
            title: Text('CRM'.tr),
            onTap: () {},
          ),
          ListTile(
            title: Text('Vessel'.tr),
            onTap: () {},
          ),
          ListTile(
            title: Text('Crew'.tr),
            onTap: () {},
          ),
          ListTile(
            title: Text('Marine'.tr),
            onTap: () {},
          ),
          ListTile(
            title: Text('changelang'.tr),
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
