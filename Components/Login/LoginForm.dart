import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/Components/custom_surfix_icon.dart';
import 'package:monitoring/Components/default_button_custome_color.dart';
import 'package:monitoring/Screens/Login/LoginScreens.dart';
import 'package:monitoring/Screens/Register/Registrasi.dart';
import 'package:monitoring/Screens/User/HomeUserScreen.dart';
import 'package:monitoring/size_config.dart';
import 'package:monitoring/Utils/constans.dart';

class SignInform extends StatefulWidget {
  const SignInform({Key? key}) : super(key: key);
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remeber = false;

  TextEditingController txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remeber,
                  onChanged: (value) {
                    setState(() {
                      remeber = value;
                    });
                  }),
              const Text("Tetap Masuk"),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: txtEmail.text)
                      .then(
                        (value) => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'Peringatan',
                          desc: 'Link Verifikasi Telah Dikirim Ke Email',
                          btnOkOnPress: () {
                            Navigator.pushNamed(context, LoginScreen.routName);
                          },
                        ).show(),
                      )
                      .onError(
                        (error, stackTrace) => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Peringatan',
                          desc: 'Harap isi Email',
                          btnOkOnPress: () {
                            Navigator.pushNamed(context, LoginScreen.routName);
                          },
                        ).show(),
                      );
                },
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Masuk",
            press: () async {
              await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: txtEmail.text, password: txtPassword.text)
                  .then(
                    (value) => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: 'Sukses',
                      desc: 'Login Berhasil',
                      btnOkOnPress: () {
                        Navigator.pushNamed(context, HomeUserScreen.routName);
                      },
                    ).show(),
                  )
                  .onError(
                    (error, stackTrace) => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Peringatan',
                      desc: 'Email Atau Password Salah',
                      btnOkOnPress: () {
                        Navigator.pushNamed(context, LoginScreen.routName);
                      },
                    ).show(),
                  );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routName);
            },
            child: const Text(
              "Belum Punya Akun ? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukan Email Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukan Password Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }
}
