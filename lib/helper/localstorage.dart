import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;
  static Future<LocalStorage?> getInstance() async {
    _prefs ??= (await SharedPreferences.getInstance());
  }

  static setString(key, value) async {
    await getInstance();
    await _prefs!.setString(key, value);
  }

  static Future<String> getString(key) async {
    await getInstance();
    final val = _prefs!.getString(key);
    return val??"";
  }
}
