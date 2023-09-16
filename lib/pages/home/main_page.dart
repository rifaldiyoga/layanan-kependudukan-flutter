import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/pages/home/home_page.dart';
import 'package:layanan_kependudukan/pages/home/notification_page%20.dart';
import 'package:layanan_kependudukan/pages/home/settings_page.dart';
import 'package:layanan_kependudukan/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: BottomAppBar(
            child: BottomNavigationBar(
                backgroundColor: backgroundColor2,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Container(
                        child: Image.asset(
                          "assets/icon_home.png",
                          width: 24,
                          fit: BoxFit.fill,
                          color: currentIndex == 0
                              ? primaryColor
                              : Color(0xff808191),
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Image.asset(
                          "assets/icon_bell.png",
                          width: 20,
                          fit: BoxFit.fill,
                          color: currentIndex == 1
                              ? primaryColor
                              : Color(0xff808191),
                        ),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Image.asset(
                            "assets/icon_settings.png",
                            width: 30,
                            color: currentIndex == 2
                                ? primaryColor
                                : Color(0xff808191),
                          )),
                      label: ""),
                ]),
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return NotificationPage();
        case 2:
          return SettingsPage();
      }
      return HomePage();
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
