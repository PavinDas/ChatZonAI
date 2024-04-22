import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Pref {
  static late Box _box;

  static Future<void> Initialize() async {
    //? For accessing Hive to the app directory
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: 'myData');
  }

  static bool get showOnboarding => _box.get(
        'showOnboarding',
        defaultValue: true,
      );
      static set showOnboarding(bool value) => _box.put('showOnboarding', value);
}
