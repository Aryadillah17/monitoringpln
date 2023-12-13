import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/Screens/Login/LoginScreens.dart';
import 'package:monitoring/routes.dart';
import 'package:monitoring/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Monitoring P2TL",
    theme: theme(),
    initialRoute: LoginScreen.routName,
    routes: routes,
  ));
}
