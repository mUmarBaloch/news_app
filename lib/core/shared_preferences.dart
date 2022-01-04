import 'package:news_app/core/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
