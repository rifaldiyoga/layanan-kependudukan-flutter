import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String icon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TextField();
}

class TextField extends State<CustomTextField> {
  @override
  Widget build(Object context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              widget.icon,
              width: 20,
              color: primaryColor,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.hintText,
                    textAlign: TextAlign.start,
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                    controller: widget.controller,
                    obscureText: widget.obscureText,
                    style: primaryTextStyle,
                    decoration: const InputDecoration.collapsed(hintText: "")),
              ],
            )),
          ],
        ));
  }
}
