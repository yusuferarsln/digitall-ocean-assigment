import 'package:digital_ocean_app/ui/controller/controller.dart';
import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller());
  CrewController crewController = Get.put(CrewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children: [
                SavedList(controller, width, height, crewController),
                SavedList(controller, width, height, crewController)
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView SavedList(Controller controller, double width, double height,
      CrewController crewController) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GetBuilder<CrewController>(builder: (crewController) {
            return Container(
              height: height * 0.1,
              width: width * 0.3,
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: 15.allBR),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"),
                      minRadius: 100,
                      maxRadius: 100,
                    ),
                    title: Text(crewController.firstName[index]),
                    subtitle: Text(crewController.lastName[index]),
                    trailing:
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                  )),
            );
          });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: crewController.firstName.length);
  }
}
