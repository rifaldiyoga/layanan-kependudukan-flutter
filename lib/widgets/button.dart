import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            text,
            style:
                onPrimaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
            side: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(16),
          )),
          child: Text(
            text,
            style: blueTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )),
    );
  }
}
