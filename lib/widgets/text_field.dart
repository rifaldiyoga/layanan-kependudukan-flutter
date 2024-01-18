import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/button.dart';

enum TypeField { DATE, TIME }

class CustomTextField extends StatefulWidget {
  final String titleText;
  final String? hintText;
  final String? icon;
  final bool obscureText;
  final TypeField? type;
  final bool isRequired;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextField(
      {Key? key,
      required this.titleText,
      this.hintText,
      this.icon,
      this.type,
      this.isRequired = true,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TextField();
}

class TextField extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    Future _selectDate() async {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2020),
          lastDate: new DateTime(2030));
      if (picked != null) {
        widget.controller.text =
            DateFormater.dateTimeToString(picked, "yyyy-MM-dd");
      }
    }

    Future _selectTime() async {
      TimeOfDay? picked =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (picked != null) {
        widget.controller.text = picked.format(context);
      }
    }

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.icon != null
                ? Row(
                    children: [
                      Image.asset(
                        widget.icon!,
                        width: 20,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  )
                : const SizedBox(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        widget.titleText,
                        textAlign: TextAlign.start,
                        style: blueTextStyle.copyWith(fontSize: 12),
                      ),
                      widget.isRequired
                          ? Text(
                              " *",
                              textAlign: TextAlign.start,
                              style: secondaryTextStyle.copyWith(
                                  fontSize: 12,
                                  color: redColor,
                                  fontWeight: FontWeight.bold),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    onTap: () async {
                      if (widget.type == TypeField.DATE) {
                        _selectDate();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                      if (widget.type == TypeField.TIME) {
                        _selectTime();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      }
                    },
                    controller: widget.controller,
                    obscureText: widget.obscureText,
                    style: primaryTextStyle,
                    keyboardType: widget.keyboardType,
                    cursorHeight: 20,
                    decoration: InputDecoration.collapsed(
                        hintText: widget.hintText ?? "",
                        hintStyle: secondaryTextStyle.copyWith(fontSize: 14))),
              ],
            )),
          ],
        ));
  }
}

class CustomChooseFile extends StatelessWidget {
  final String titleText;
  final String? hintText;
  final String? path;
  final bool isRequired;
  final VoidCallback onPressed;

  const CustomChooseFile(
      {super.key,
      required this.onPressed,
      this.path,
      this.hintText,
      this.isRequired = true,
      required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    child: Container(
                  child: Text(
                    titleText,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: blueTextStyle.copyWith(fontSize: 12),
                  ),
                )),
                Text(
                  " *",
                  textAlign: TextAlign.start,
                  style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      color: redColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: PrimaryButton(
                        text: "Pilih File",
                        onPressed: () {
                          onPressed();
                        })),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Flexible(
                                child: Container(
                              child: Text(
                                path ?? "",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    secondaryTextStyle.copyWith(fontSize: 12),
                              ),
                            )),
                          ],
                        ))),
              ],
            )
          ],
        ));
  }
}
