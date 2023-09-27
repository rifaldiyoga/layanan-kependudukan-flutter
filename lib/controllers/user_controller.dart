import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/user_repository.dart';
import 'package:layanan_kependudukan/models/auth_response_model.dart';

class UserController extends GetxController {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  UserModel getUser() {
    return userRepository.getUser();
  }
}
