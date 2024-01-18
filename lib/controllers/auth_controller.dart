import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/auth_repository.dart';
import 'package:layanan_kependudukan/models/auth_response_model.dart';
import 'package:layanan_kependudukan/models/response_model.dart';
import 'package:layanan_kependudukan/models/signin_model.dart';
import 'package:layanan_kependudukan/models/usermodel_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> signUp(SignUpModel signUpModel) async {
    _isLoading = true;
    update();
    final response = await authRepository.signUp(signUpModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      var user = AuthModel.fromJson(response.data!).data!;
      authRepository.saveUserToken(user.token!);
      authRepository.saveUser(user);
      responseModel = ResponseModel(true, "");
    } else {
      responseModel = ResponseModel(false, response.data["message"]!);
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> signIn(SignInModel signInModel) async {
    _isLoading = true;
    update();
    final response = await authRepository.signIn(signInModel);
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      var user = AuthModel.fromJson(response.data).data!;
      authRepository.saveUserToken(user.token!);
      authRepository.saveUser(user);
      responseModel = ResponseModel(true, user.token!);
    } else {
      responseModel = ResponseModel(false, response.data["message"]!);
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> signOut() async {
    _isLoading = true;
    update();
    final response = await authRepository.signOut();
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      var user = AuthModel.fromJson(response.data).data!;
      authRepository.saveUserToken(user.token!);
      authRepository.saveUser(user);
      responseModel = ResponseModel(true, user.token!);
    } else {
      responseModel = ResponseModel(false, response.data["message"]!);
    }

    _isLoading = false;
    update();

    return responseModel;
  }

  Future<String> getUserToken() async {
    return await authRepository.getUserToken();
  }

  clearSharedPref() {
    return authRepository.clearSharedPreferences();
  }
}
