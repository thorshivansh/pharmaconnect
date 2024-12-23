import 'package:shared_preferences/shared_preferences.dart';

// ignore_for_file: must_be_immutable
class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  /// Initialize Shared Preferences
  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  /// Clear all data stored in preferences
  static Future<void> clearPreferencesData() async {
    await _sharedPreferences!.clear();
  }

  /// Set theme data
  static Future<void> setThemeData(String value) async {
    await _sharedPreferences!.setString('themeData', value);
  }

  /// Get theme data
  static String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData') ?? 'primary';
    } catch (e) {
      return 'primary';
    }
  }
}
