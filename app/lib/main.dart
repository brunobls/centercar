import 'package:app/config/startup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/startup_bindings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: Startup.routes,
      theme: Startup.appTheme,
      initialBinding: StartupBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
