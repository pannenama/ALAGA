import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileStore {
  static const _kFirstName = "first_name";
  static const _kMiddleName = "middle_name";
  static const _kLastName = "last_name";
  static const _kBirthdate = "birthdate"; // "MM/DD/YYYY"
  static const _kHealthId = "health_id";

  static Future<void> saveProfile({
    required String firstName,
    String? middleName,
    required String lastName,
    required String birthdate,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kFirstName, firstName);
    await prefs.setString(_kMiddleName, middleName ?? "");
    await prefs.setString(_kLastName, lastName);
    await prefs.setString(_kBirthdate, birthdate);

    // Generate once if missing
    final existing = prefs.getString(_kHealthId);
    if (existing == null || existing.isEmpty) {
      await prefs.setString(_kHealthId, _generateHealthId());
    }
  }

  static Future<Map<String, String>> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "firstName": prefs.getString(_kFirstName) ?? "Juan",
      "middleName": prefs.getString(_kMiddleName) ?? "",
      "lastName": prefs.getString(_kLastName) ?? "Dela Cruz",
      "birthdate": prefs.getString(_kBirthdate) ?? "05/12/1990",
      "healthId": prefs.getString(_kHealthId) ?? "P-0000-0000",
    };
  }

  static String _generateHealthId() {
    // Demo-safe: P-####-####
    final r = Random();
    final a = (1000 + r.nextInt(9000));
    final b = (1000 + r.nextInt(9000));
    return "P-$a-$b";
  }
}
