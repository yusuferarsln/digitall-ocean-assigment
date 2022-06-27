import 'package:digital_ocean_app/ui/model/crew_model.dart';
import 'package:get/get.dart';

class CrewController extends GetxController {
  final crewMembers = CrewModel().obs;

  CrewModel cMember1 = new CrewModel(
      firstName: "Yusuf",
      lastName: "er",
      Nationality: "TR",
      jobTitle: "Senior",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2020', '10.01.2002', '01.04.2004']);
  CrewModel cMember2 = new CrewModel(
      firstName: "Serlan",
      lastName: "er",
      Nationality: "TR",
      jobTitle: "Senior",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2020', '10.01.2002', '01.04.2004']);
  CrewModel cMember3 = new CrewModel(
      firstName: "Berfin",
      lastName: "er",
      Nationality: "TR",
      jobTitle: "Senior",
      image:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/59318f68178249.5b540076b3889.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2020', '10.01.2002', '01.04.2004']);
  CrewModel cMember4 = new CrewModel(
      firstName: "Tunca",
      lastName: "er",
      Nationality: "TR",
      jobTitle: "Senior",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2020', '10.01.2002', '01.04.2004']);
  List<CrewModel> crewList = [];

  buildList() {
    crewList.add(cMember1);
    crewList.add(cMember2);
    crewList.add(cMember3);
    crewList.add(cMember4);
    update();
  }
}
