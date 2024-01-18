import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class CustomDropDown extends StatelessWidget {
  final String titleText;
  final String? icon;
  final List<String> items;
  final String? value;
  final bool isRequired;
  final TextEditingController controller;
  final Function(String?) onChange;

  const CustomDropDown(
      {Key? key,
      required this.titleText,
      this.icon,
      required this.items,
      this.value,
      this.isRequired = true,
      required this.onChange,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon != null
                ? Row(
                    children: [
                      Image.asset(
                        icon!,
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
                Row(children: [
                  Text(
                    titleText,
                    textAlign: TextAlign.start,
                    style: blueTextStyle.copyWith(fontSize: 12),
                  ),
                  isRequired
                      ? Text(
                          " *",
                          textAlign: TextAlign.start,
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                              color: redColor,
                              fontWeight: FontWeight.bold),
                        )
                      : SizedBox(),
                ]),
                SizedBox(
                    height: 30,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      underline: const SizedBox(),
                      value: value,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: primaryTextStyle,
                              )))
                          .toList(),
                      onChanged: onChange,
                    ))
              ],
            )),
          ],
        ));
  }
}

class CustomAutoComplete extends StatelessWidget {
  final String hintText;
  final String? icon;
  final List<String> items;
  final String? value;
  final bool isRequired;
  final TextEditingController controller;
  final Function(String?) onSelected;

  const CustomAutoComplete(
      {Key? key,
      required this.hintText,
      this.icon,
      required this.items,
      this.value,
      this.isRequired = true,
      required this.onSelected,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon != null
                ? Row(
                    children: [
                      Image.asset(
                        icon!,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    hintText,
                    textAlign: TextAlign.start,
                    style: blueTextStyle.copyWith(fontSize: 12),
                  ),
                  isRequired
                      ? Text(
                          " *",
                          textAlign: TextAlign.start,
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12,
                              color: redColor,
                              fontWeight: FontWeight.bold),
                        )
                      : SizedBox(),
                ]),
                SizedBox(
                  height: 40,
                  child: Autocomplete<String>(
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 4.0,
                          child: SizedBox(
                            height: 200.0,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(8.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String option = options.elementAt(index);
                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: ListTile(
                                    title: Text(option),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 0),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      );
                    },
                    optionsBuilder: (TextEditingValue value) {
                      if (value.text == "") {}
                      return items.where((element) => element
                          .toLowerCase()
                          .contains(value.text.toLowerCase()));
                    },
                    onSelected: onSelected,
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
