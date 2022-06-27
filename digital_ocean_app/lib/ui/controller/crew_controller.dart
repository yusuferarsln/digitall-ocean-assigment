import 'package:digital_ocean_app/ui/model/crew_model.dart';
import 'package:get/get.dart';

class CrewController extends GetxController {
  final crewMembers = CrewModel().obs;

  CrewModel cMember1 = new CrewModel(
      firstName: "Ellis",
      lastName: "Peralta",
      Nationality: "USA",
      jobTitle: "Head of Team",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2020', '10.01.2002', '01.04.2004']).obs();
  CrewModel cMember2 = new CrewModel(
      firstName: "Marley",
      lastName: "Trevino",
      Nationality: "USA",
      jobTitle: "Captain",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['09.09.2020']).obs();
  CrewModel cMember3 = new CrewModel(
      firstName: "Berfin",
      lastName: "Terzi",
      Nationality: "TR",
      jobTitle: "Manager",
      image:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/59318f68178249.5b540076b3889.png",
      certificateNames: [
        'Certificate 1',
        'Certificate 2',
        'Certificate 3',
        'Certificate 4',
        'Certificate 5',
        'Certificate 6',
      ],
      certificateDates: [
        '10.03.2020',
        '10.01.2002',
        '01.04.2004',
        '11.04.2006',
        '21.12.2007',
        '19.06.2008',
      ]).obs();
  CrewModel cMember4 = new CrewModel(
      firstName: "Tunca",
      lastName: "Ersoy",
      Nationality: "TR",
      jobTitle: "Worker",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['10.03.2010']).obs();
  CrewModel cMember5 = new CrewModel(
      firstName: "Saleemi",
      lastName: "Rashwani",
      Nationality: "KSA",
      jobTitle: "Medical Purser",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: [
        'Certificate 1',
        'Certificate 2',
        'Certificate 3',
        'Certificate 4'
      ],
      certificateDates: [
        '10.11.2008',
        '21.08.2000',
        '22.07.2001',
        '20.06.2003'
      ]).obs();
  CrewModel cMember6 = new CrewModel(
      firstName: "Gerasim",
      lastName: "Kiselev",
      Nationality: "RU",
      jobTitle: "Cook",
      image:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/59318f68178249.5b540076b3889.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['10.04.2007']).obs();
  CrewModel cMember7 = new CrewModel(
      firstName: "Deniz",
      lastName: "Derya",
      Nationality: "TR",
      jobTitle: "Chief Engineer",
      image:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/59318f68178249.5b540076b3889.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['10.03.2010']).obs();
  CrewModel cMember8 = new CrewModel(
      firstName: "Ulu",
      lastName: "Dura",
      Nationality: "TR",
      jobTitle: "2nd Engineer",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['02.01.2001']).obs();
  CrewModel cMember9 = new CrewModel(
      firstName: "Mohammad",
      lastName: "Samer",
      Nationality: "KSA",
      jobTitle: "Watch Leader",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1', 'Certificate 2', 'Certificate 3'],
      certificateDates: ['10.03.2011', '10.03.2012', '10.03.2013']).obs();
  CrewModel cMember10 = new CrewModel(
      firstName: "Yusuf",
      lastName: "Durmaz",
      Nationality: "TR",
      jobTitle: "Worker",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['10.03.2010']).obs();
  CrewModel cMember11 = new CrewModel(
      firstName: "Batuhan",
      lastName: "Taş",
      Nationality: "TR",
      jobTitle: "Worker",
      image:
          "https://www.pngitem.com/pimgs/m/4-42408_vector-art-design-men-fashion-vector-art-illustration.png",
      certificateNames: ['Certificate 1'],
      certificateDates: ['10.03.2010']).obs();

  List<CrewModel> crewList = [];

  buildList() {
    crewList.add(cMember1);
    crewList.add(cMember2);
    crewList.add(cMember3);
    crewList.add(cMember4);
    crewList.add(cMember5);
    crewList.add(cMember6);
    crewList.add(cMember7);
    crewList.add(cMember8);
    crewList.add(cMember9);
    crewList.add(cMember10);
    crewList.add(cMember11);

    update();
  }
}
