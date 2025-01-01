import 'package:flutter/material.dart';
import './Views/HomePage.dart';
import 'package:get/get.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'Views/Login.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, secondary: Colors.blue),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

