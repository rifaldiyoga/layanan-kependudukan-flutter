import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UserRepository({required this.apiClient, required this.sharedPreferences});

  String getUser() {
    return sharedPreferences.getString(AppConstants.NAME) ?? "";
  }
}
