import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets//button.dart';
import 'package:layanan_kependudukan/widgets//text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var codeController = TextEditingController();

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
              "Please enter the verification code",
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputVerif() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: CustomTextField(
          titleText: "Kode Verifikasi",
          icon: "assets/icon_password.png",
          controller: codeController,
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: PrimaryButton(
          text: "Verifikasi",
          onPressed: () {
            Navigator.pushNamed(context, "/verif");
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: mg16),
          child: Column(
            children: [
              const Spacer(),
              header(),
              inputVerif(),
              buttonLogin(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
