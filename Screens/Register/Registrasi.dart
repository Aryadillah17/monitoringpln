import 'package:flutter/material.dart';
import 'package:monitoring/Components/Register/RegisterComponent.dart';
import 'package:monitoring/size_config.dart';

class RegisterScreen extends StatelessWidget {
  static String routName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegistrasiComponent(),
    );
  }
}
