import 'package:get/get.dart';
import 'package:layanan_kependudukan/data/repository/user_repository.dart';

class UserController extends GetxController {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  String getUser() {
    return userRepository.getUser();
  }
}
