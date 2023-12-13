import 'package:flutter/material.dart';
import 'package:monitoring/Screens/Login/LoginScreens.dart';
import 'package:monitoring/Screens/Register/Registrasi.dart';
import 'package:monitoring/Screens/User/Crud/EditDataScreen.dart';
import 'package:monitoring/Screens/User/Crud/InputDataScreen.dart';
import 'package:monitoring/Screens/User/HomeUserScreen.dart';
import 'package:monitoring/Screens/User/Crud/TampilDataScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routName: (context) => LoginScreen(),
  RegisterScreen.routName: (context) => RegisterScreen(),
  HomeUserScreen.routName: (context) => HomeUserScreen(),
  InputDataScreen.routName: (context) => InputDataScreen(),
  EditDataScreen.routName: (context) => EditDataScreen(),
  TampilDataScreen.routName: (context) => TampilDataScreen()
};
