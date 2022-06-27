import 'package:digital_ocean_app/ui/controller/controller.dart';
import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
import 'package:digital_ocean_app/ui/view/marine_location.dart';
import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:digital_ocean_app/ui/view/crew_detail.dart';
import 'package:digital_ocean_app/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';

class CrewPage extends StatefulWidget {
  CrewPage({Key? key}) : super(key: key);

  @override
  State<CrewPage> createState() => _CrewPageState();
}

class _CrewPageState extends State<CrewPage> {
  Controller controller = Get.put(Controller());
  CrewController crewController = Get.put(CrewController());

  @override
  void initState() {
    // TODO: implement initState
    void doNothing() {}

    crewController.buildList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: palleteLightBlue,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                children: [
                  SavedList(controller, width, height, crewController),
                  MarineLocation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView SavedList(Controller controller, double width,
      double height, CrewController crewController) {
    return SingleChildScrollView(
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
                              title: Text("name".tr +
                                  ":" +
                                  "${crewController.crewList[index].firstName.toString()} ${crewController.crewList[index].lastName.toString()}"),
                              subtitle: Text("jobtitle".tr +
                                  ":" +
                                  "${crewController.crewList[index].jobTitle}"
                                      .tr),
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
    );
  }
}
