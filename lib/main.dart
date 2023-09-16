import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/helpers/dependencies.dart' as dependencies;
import 'package:layanan_kependudukan/routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}
