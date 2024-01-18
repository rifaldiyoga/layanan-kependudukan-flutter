import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/base/show_message.dart';
import 'package:layanan_kependudukan/controllers/auth_controller.dart';
import 'package:layanan_kependudukan/helpers/loading_helper.dart';
import 'package:layanan_kependudukan/models/signin_model.dart';
import 'package:layanan_kependudukan/routes/route_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets//button.dart';
import 'package:layanan_kependudukan/widgets//text_field.dart';

import '../../services/message_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _messagingService = MessagingService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messagingService.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Widget header() {
      return Container(
        margin: EdgeInsets.only(bottom: mg16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
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

    Widget inputEmail() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Email",
          icon: "assets/icon_email.png",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
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

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: mg16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account ",
              style: secondaryTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getSignUp());
                },
                child: Text(
                  "Sign Up?",
                  style: blueTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ))
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        resizeToAvoidBottomInset: false,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            void signIn(AuthController authController) {
              var email = emailController.text.toString();
              var password = passwordController.text.toString();
              var msg = "";

              if (email.isEmpty) {
                msg = "Email tidak boleh kosong!";
              }
              if (!GetUtils.isEmail(email)) {
                msg = "Email tidak valid!";
              }
              if (password.isEmpty) {
                msg = "Password tidak boleh kosong!";
              }
              if (msg.isEmpty) {
                Get.find<LoadingHelper>().showLoadingHelper(context);
                authController
                    .signIn(SignInModel(
                        email: email,
                        password: password,
                        token: MessagingService.fcmToken ?? ""))
                    .then((status) {
                  Get.find<LoadingHelper>().dismissLoading();
                  if (status.isSuccess) {
                    Get.offNamed(RouteHelper.getHome(),
                        preventDuplicates: true);
                  } else {
                    showMessage(status.message);
                  }
                });
              } else {
                showMessage(msg);
              }
            }

            Widget buttonLogin() {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: PrimaryButton(
                  text: "Sign In",
                  onPressed: () {
                    signIn(authController);
                  },
                ),
              );
            }

            return SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: mg16),
                child: Column(
                  children: [
                    const Spacer(),
                    header(),
                    inputEmail(),
                    inputPassword(),
                    buttonLogin(),
                    footer(),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
