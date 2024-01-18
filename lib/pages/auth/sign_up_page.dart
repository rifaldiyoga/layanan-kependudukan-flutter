import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/base/show_message.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/usermodel_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/services/message_service.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets//button.dart';
import 'package:layanan_kependudukan/widgets//text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    var emailController = TextEditingController();
    var namaController = TextEditingController();
    var passwordController = TextEditingController();
    var nikController = TextEditingController();

    void signUp() {
      var nik = nikController.text.toString();
      var name = namaController.text.toString();
      var email = emailController.text.toString();
      var password = passwordController.text.toString();
      var msg = "";

      if (nik.isEmpty) {
        msg = "NIK tidak boleh kosong!";
      }
      if (name.isEmpty) {
        msg = "NIK tidak boleh kosong!";
      }
      if (email.isEmpty) {
        msg = "NIK tidak boleh kosong!";
      }
      if (!GetUtils.isEmail(email)) {
        msg = "NIK tidak boleh kosong!";
      }
      if (password.isEmpty) {
        msg = "NIK tidak boleh kosong!";
      }
      if (password.length < 8) {
        msg = "NIK tidak boleh kosong!";
      }
      if (msg.isEmpty) {
        Get.find<LoadingHelper>().showLoadingHelper(context);
        authController
            .signUp(SignUpModel(
                nik: nik,
                name: name,
                email: email,
                password: password,
                token: MessagingService.fcmToken ?? ""))
            .then((status) {
          Get.find<LoadingHelper>().dismissLoading();
          if (status.isSuccess) {
            Get.offNamed(RouteHelper.getHome(), preventDuplicates: true);
          } else {
            showMessage(status.message);
          }
        });
      } else {
        showMessage(msg);
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: mg16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up!",
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Please enter the required details",
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputNik() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Nomor Induk Penduduk",
          icon: "assets/icon_email.png",
          controller: nikController,
        ),
      );
    }

    Widget inputNama() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Nama Lengkap",
          icon: "assets/icon_email.png",
          controller: namaController,
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Email",
          icon: "assets/icon_email.png",
          controller: emailController,
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Password",
          icon: "assets/icon_password.png",
          obscureText: true,
          controller: passwordController,
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: PrimaryButton(
          text: "Sign Up",
          onPressed: () {
            signUp();
          },
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: mg16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Have an account ",
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
                onTap: () => Get.toNamed(RouteHelper.getSignUp()),
                child: Text(
                  "Sign In?",
                  style: blueTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ))
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: GetBuilder<AuthController>(builder: (authController) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: mg16),
              child: Column(
                children: [
                  const Spacer(),
                  header(),
                  inputNik(),
                  inputNama(),
                  inputEmail(),
                  inputPassword(),
                  buttonLogin(),
                  footer(),
                  const Spacer(),
                ],
              ),
            ),
          );
        }));
  }
}
