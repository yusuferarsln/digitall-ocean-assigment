import 'package:digital_ocean_app/ui/controller/crew_controller.dart';
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
      appBar: AppBar(
          title: Text(
              'Employee ${crewController.crewList[data].firstName} ${crewController.crewList[data].lastName}')),
      body: Center(
        child: Container(
          height: height * 0.9,
          width: width * 0.9,
          child: Card(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    crewController.crewList[data].image.toString(),
                  ),
                  maxRadius: 100,
                  minRadius: 100,
                ),
              ),
              Text(
                '${crewController.crewList[data].firstName} ${crewController.crewList[data].lastName}',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                crewController.crewList[data].jobTitle.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CertificateList(width, height),
              ),
              ElevatedButton(
                  onPressed: () {
                    buildLanguageDialog(
                        context, crewController, data, width, height);
                  },
                  child: Text('Edit Employee'))
            ],
          )),
        ),
      ),
    );
  }

  buildLanguageDialog(BuildContext context, CrewController crewController,
      var data, double width, double height) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Certificates'),
            content: Container(
                width: double.maxFinite, child: CertificateList(width, height)),
          );
        });
  }

  ListView CertificateList(
    double width,
    double height,
  ) {
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
                    title: Text(
                        crewController.crewList[data].certificateNames![index]),
                    subtitle: Text(
                        crewController.crewList[data].certificateDates![index]),
                    trailing: Text(
                        crewController.crewList[index].Nationality.toString()),
                  )),
            );
          });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: crewController.crewList[data].certificateNames!.length);
  }
}