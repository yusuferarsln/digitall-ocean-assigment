import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_Us': {'hello': 'Hello'},
        'tr_TR': {'hello': 'Merhaba'},
      };
}
