import 'dart:convert';

import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/api/api_client.dart';
import 'package:layanan_kependudukan/models/auth_response_model.dart';
import 'package:layanan_kependudukan/models/signin_model.dart';
import 'package:layanan_kependudukan/models/usermodel_model.dart';
import 'package:layanan_kependudukan/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> signUp(SignUpModel signUpModel) async {
    return await apiClient.postData(
        AppConstants.REGISTER_URL, signUpModel.toJson());
  }

  Future<Response> signIn(SignInModel signInModel) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URL, signInModel.toJson());
  }

  saveUserToken(
    String token,
  ) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  saveUser(UserModel userModel) async {
    await sharedPreferences.setString(AppConstants.USER, jsonEncode(userModel));
  }

  Future<String> getUserToken() async {
    String token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    apiClient.updateHeader(token);
    return token;
  }

  bool clearSharedPreferences() {
    sharedPreferences.clear();
    apiClient.updateHeader('');
    return true;
  }
}
