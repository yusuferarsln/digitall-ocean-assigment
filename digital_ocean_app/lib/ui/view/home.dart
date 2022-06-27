import 'package:digital_ocean_app/ui/controller/controller.dart';
import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
import 'package:digital_ocean_app/ui/marine_location.dart';
import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:digital_ocean_app/ui/view/crew_detail.dart';
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
    crewController.buildList();
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded SavedList(Controller controller, double width, double height,
      CrewController crewController) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GetBuilder<CrewController>(builder: (crewController) {
                return InkWell(
                  onTap: () {
                    Get.to(CrewDetailPage(), arguments: index);
                  },
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.3,
                    color: Colors.transparent,
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: 15.allBR),
                        child: crewController.crewList != null
                            ? ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(crewController
                                      .crewList[index].image
                                      .toString()),
                                  minRadius: 40,
                                  maxRadius: 40,
                                ),
                                tileColor: Colors.transparent,
                                title: Text(
                                    "Name: ${crewController.crewList[index].firstName.toString()} ${crewController.crewList[index].lastName.toString()}"),
                                subtitle: Text(
                                    "Job Title : ${crewController.crewList[index].jobTitle}"),
                                trailing: Text(crewController
                                    .crewList[index].Nationality
                                    .toString()),
                              )
                            : CircularProgressIndicator()),
                  ),
                );
              });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 15,
              );
            },
            itemCount: crewController.crewList.length),
      ),
    );
  }
}
