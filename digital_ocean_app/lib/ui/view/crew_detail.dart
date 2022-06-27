import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
import 'package:digital_ocean_app/ui/pallette/colorpallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';

class CrewDetailPage extends StatefulWidget {
  CrewDetailPage({Key? key}) : super(key: key);

  @override
  State<CrewDetailPage> createState() => _CrewDetailPageState();
}

class _CrewDetailPageState extends State<CrewDetailPage> {
  CrewController crewController = Get.put(CrewController());
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: palleteLightBlue,
      appBar:
          AppBar(backgroundColor: palleteLightBlue, title: Text('Employee'.tr)),
      body: Center(
        child: Container(
          height: height * 0.9,
          width: width * 0.9,
          child: Card(
              color: palleteSoft,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          buildImage(context, crewController, data,
                              crewController.crewList[data].image.toString());
                        },
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                crewController.crewList[data].image.toString(),
                              ),
                              maxRadius: 100,
                              minRadius: 100,
                            ),
                            Positioned(
                              child: Icon(
                                Icons.zoom_in,
                                size: 40,
                              ),
                              left: 20,
                              top: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '${crewController.crewList[data].firstName} ${crewController.crewList[data].lastName}',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      crewController.crewList[data].jobTitle.toString().tr,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                palleteBlue.withOpacity(0.4))),
                        onPressed: () {
                          buildLanguageDialog(
                              context, crewController, data, width, height);
                        },
                        child: Text('Edit Employee'.tr)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CertificateList(width, height),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  buildLanguageDialog(BuildContext context, CrewController crewController,
      var data, double width, double height) {
    showDialog(
        barrierColor: palleteLightBlue.withOpacity(0.6),
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Certificates'.tr),
            content: Container(
                width: double.maxFinite,
                child: Expanded(
                  child: CertificateList(width, height),
                )),
          );
        });
  }

  buildImage(
    BuildContext context,
    CrewController crewController,
    var data,
    String image,
  ) {
    showDialog(
        barrierColor: palleteLightBlue.withOpacity(0.6),
        context: context,
        builder: (builder) {
          return AlertDialog(
            content: Container(
                width: double.maxFinite,
                child: Expanded(
                  child: Image.network(image),
                )),
          );
        });
  }

  SingleChildScrollView CertificateList(
    double width,
    double height,
  ) {
    return SingleChildScrollView(
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GetBuilder<CrewController>(builder: (crewController) {
              return Container(
                height: height * 0.1,
                width: width * 0.3,
                child: Card(
                    shape: RoundedRectangleBorder(borderRadius: 15.allBR),
                    child: ListTile(
                      title: Text(crewController
                              .crewList[data].certificateNames![index]
                              .substring(0, 11)
                              .tr +
                          crewController.crewList[data].certificateNames![index]
                              .substring(
                            11,
                          )),
                      subtitle: Text(crewController
                          .crewList[data].certificateDates![index]),
                      trailing: Text((index + 1).toString()),
                    )),
              );
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: crewController.crewList[data].certificateNames!.length),
    );
  }
}
