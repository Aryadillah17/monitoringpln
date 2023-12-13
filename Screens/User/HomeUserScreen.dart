import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/HomeUserComponent.dart';
import 'package:monitoring/Screens/Login/LoginScreens.dart';
import 'package:monitoring/Screens/User/Crud/InputDataScreen.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class HomeUserScreen extends StatelessWidget {
  static String routName = "/home_user";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        title: const Text(
          "MONITORING INPUT DATA",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                InputDataScreen.routName,
              );
            },
            child: const Row(children: [
              Icon(
                Icons.add,
                color: mTitleColor,
              ),
              Text(
                "Input Data",
                style:
                    TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
              )
            ]),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const HomeUserComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut().then(
                (value) => AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.rightSlide,
                        title: 'Keluar',
                        desc: 'Apakah ingin Keluar ?',
                        btnOkOnPress: () {
                          Navigator.pushNamed(context, LoginScreen.routName);
                        },
                        btnCancelOnPress: () {})
                    .show(),
              );
        },
        backgroundColor: kColorRedSlow,
        child: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
