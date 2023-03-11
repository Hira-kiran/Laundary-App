import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshippractice/widgetss/buttomNav.dart';
import 'Constants/general_controller.dart';

void main() async {
  Get.put(GeneralController());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          title: 'Lottery App',
          home: const MyNav(),
        );
      },
    );
  }
}
