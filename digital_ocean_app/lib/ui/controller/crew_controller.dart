import 'package:get/get.dart';

class CrewController extends GetxController {
  List<String> firstName = ['ab', 'cab', 'buc'].obs;
  List<String> lastName = ['ab', 'cawdasdb', 'buzxxx1x1c'].obs;
  List<String> Nationality = ['ab', 'c312312ab', 'buc'].obs;
  List<String> jobTittle = ['a31231b', 'cab', 'buc'].obs;
  List<String> certificates = ['a23123b', 'cab', 'buc'].obs;

  List get gfirstName => firstName;
  List get glastName => lastName;

  List get gNationality => Nationality;

  List get gJobTitle => jobTittle;

  List get gCertificates => certificates;
}
