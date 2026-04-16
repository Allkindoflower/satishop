import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveLoginData(String username) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("local_username", username);
  }

  Future<String> fetchLoginData() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("local_username") ?? "";
  }

  Future<void> clearLoginData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("local_username");
  }
}
