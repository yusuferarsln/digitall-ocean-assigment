import 'package:digital_ocean_app/localization/controller/languageController.dart';
import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
import 'package:digital_ocean_app/ui/view/marine_location.dart';
import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:digital_ocean_app/ui/view/crew.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LanguageController languageController = Get.put(LanguageController());
CrewController crewController = Get.put(CrewController());

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
              'contracts'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'crm'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'vessel'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'crew'.tr,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'marine'.tr,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w300, color: Colors.red),
            ),
            onTap: () {
              Get.to(MarineLocation());
            },
          ),
          ListTile(
            title: Text(
              'settings'.tr,
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
          title: Text('changeLang'.tr),
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
  crewController.deleteList();
  localization == "English"
      ? languageController.changeLanguage('en', 'Us')
      : languageController.changeLanguage('tr', 'Tr');
  localization == "English"
      ? Get.snackbar('Success', 'App language is now English',
          snackPosition: SnackPosition.BOTTOM)
      : Get.snackbar('Ba??ar??l??', 'Uygulama dili art??k T??rk??e',
          snackPosition: SnackPosition.BOTTOM);
  Navigator.pop(context);
  crewController.buildList();
}

final List locale = [
  {'name': 'English', 'locale': Locale('en', 'US')},
  {'name': 'T??rk??e', 'locale': Locale('tr', 'TR')},
];
