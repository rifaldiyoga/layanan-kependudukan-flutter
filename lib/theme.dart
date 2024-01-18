import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double mg4 = 4.0;
double mg8 = 8.0;
double mg16 = 16.0;
double mg20 = 20.0;
double mg24 = 24.0;
double mg28 = 28.0;
double mg32 = 32.0;

const primaryColor = Color(0xff2a9ef5);
const secondaryColor = Color(0xffd5eafd);

const lightOrangeColor = Color(0xfffcdbc5);
const orangeColor = Color(0xfff78d4e);

const lightRedColor = Color(0xfffde6ee);
const redColor = Color(0xffdd567f);

const lightGreenColor = Color(0xf9cdfa85);
const greenColor = Colors.green;

const lightYellowColor = Color(0xfffeebb7);
const yellowColor = Color(0xffe3ad37);

const alertColor = Color(0xffffe8ee);
const priceTextColor = Color(0xff2C96F1);

class ColorMap {
  final Color lightColor;
  final Color color;

  const ColorMap({required this.lightColor, required this.color});
}

List<ColorMap> colorList = List.of([
  const ColorMap(lightColor: secondaryColor, color: primaryColor),
  const ColorMap(lightColor: lightOrangeColor, color: orangeColor),
  const ColorMap(lightColor: lightGreenColor, color: greenColor),
  const ColorMap(lightColor: lightYellowColor, color: yellowColor),
]);

const backgroundColor1 = Color.fromARGB(255, 248, 248, 248);
const backgroundColor2 = Color(0xfff5f5f5);
const backgroundColor3 = Color(0xff242231);
const backgroundColor4 = Color(0xff252836);

const primaryTextColor = Color(0xff070707);
const secondaryTextColor = Color(0xff919191);

TextStyle primaryTextStyle = GoogleFonts.inter(color: primaryTextColor);

TextStyle onPrimaryTextStyle =
    GoogleFonts.inter(color: const Color(0xffffffff));

TextStyle secondaryTextStyle = GoogleFonts.inter(color: secondaryTextColor);

TextStyle priceTextStyle = GoogleFonts.inter(color: priceTextColor);

TextStyle blueTextStyle = GoogleFonts.poppins(color: primaryColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
