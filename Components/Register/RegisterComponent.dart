import 'package:flutter/material.dart';
import 'package:monitoring/Components/Register/RegisterForm.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class RegistrasiComponent extends StatefulWidget {
  @override
  _RegistrasiComponent createState() => _RegistrasiComponent();
}

class _RegistrasiComponent extends State<RegistrasiComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Registrasi', style: mTitleStyle16),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SignUpform(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
