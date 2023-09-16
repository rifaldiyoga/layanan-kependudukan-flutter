import 'package:get/get.dart';

void showMessage(String msg, {bool isError = false, String title = ""}) {
  Get.snackbar(title, msg);
}
