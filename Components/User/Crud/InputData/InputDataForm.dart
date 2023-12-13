import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monitoring/Components/custom_surfix_icon.dart';
import 'package:monitoring/Components/default_button_custome_color.dart';
import 'package:monitoring/Screens/User/Crud/InputDataScreen.dart';
import 'package:monitoring/size_config.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:intl/intl.dart';

import '../../../../Screens/User/HomeUserScreen.dart';

class FormInputData extends StatefulWidget {
  const FormInputData({Key? key}) : super(key: key);
  @override
  _FormInputData createState() => _FormInputData();
}

class _FormInputData extends State<FormInputData> {
  TextEditingController txtIdPelanggan = TextEditingController(),
      txtNama = TextEditingController(),
      txtTarif = TextEditingController(),
      txtDaya = TextEditingController(),
      txtAlamat = TextEditingController(),
      txtTanggalPeriksa = TextEditingController(),
      txtMerkKwh = TextEditingController(),
      txtMerkCt = TextEditingController(),
      txtRasioCt = TextEditingController(),
      txtKetBox = TextEditingController(),
      txtIrPremier = TextEditingController(),
      txtIsPremier = TextEditingController(),
      txtItPremier = TextEditingController(),
      txtIrSekunder = TextEditingController(),
      txtIsSekunder = TextEditingController(),
      txtItSekunder = TextEditingController(),
      txtVr = TextEditingController(),
      txtVs = TextEditingController(),
      txtVt = TextEditingController(),
      txtErrorTotal = TextEditingController(),
      txtErrorKwh = TextEditingController(),
      txtCtr = TextEditingController(),
      txtCts = TextEditingController(),
      txtCtt = TextEditingController();

  FocusNode focusNode = new FocusNode();
  File? image1;
  File? image2;
  File? image3;
  File? image4;

  String imageUrl1 = '';
  String imageUrl2 = '';
  String imageUrl3 = '';
  String imageUrl4 = '';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Form(
      child: Column(
        children: [
          buildIdPelanggan(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNama(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTarif(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDaya(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAlamat(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTanggalPeriksa(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerkKwh(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMerkCt(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRasioCT(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildKetBox(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIrPremier(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIsPremier(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildItPremier(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIrSekunder(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildIsSekunder(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildItSekunder(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildVr(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildVs(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildVt(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image1 == null
              ? Container()
              : Image.file(image1!, width: 250, height: 250, fit: BoxFit.cover),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kColorGreen,
            text: "FOTO PHASOR",
            press: () async {
              await fotoPhasor();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildErrorTotal(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image2 == null
              ? Container()
              : Image.file(image2!, width: 250, height: 250, fit: BoxFit.cover),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kColorGreen,
            text: "FOTO ERROR TOTAL",
            press: () async {
              await fotoErrorTotal();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildErrorKwh(),
          SizedBox(height: getProportionateScreenHeight(30)),
          image3 == null
              ? Container()
              : Image.file(image3!, width: 250, height: 250, fit: BoxFit.cover),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kColorGreen,
            text: "FOTO ERROR KWH",
            press: () async {
              await fotoErrorKwh();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCtr(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCts(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCtt(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          image4 == null
              ? Container()
              : Image.file(image4!, width: 250, height: 250, fit: BoxFit.cover),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kColorGreen,
            text: "FOTO ERROR CT",
            press: () async {
              await fotoErrorCt();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
              color: kPrimaryColor,
              text: "SUBMIT",
              press: () async {
                users.add({
                  'id_pelanggan': txtIdPelanggan.text,
                  'nama': txtNama.text,
                  'tarif': txtTarif.text,
                  'daya': txtDaya.text,
                  'alamat': txtAlamat.text,
                  'tanggal_periksa': txtTanggalPeriksa.text,
                  'merk_kwh': txtMerkKwh.text,
                  'merk_ct': txtMerkCt.text,
                  'rasio_ct': txtRasioCt.text,
                  'ket_box': txtKetBox.text,
                  'ir_premier': txtIrPremier.text,
                  'is_premier': txtIsPremier.text,
                  'it_premier': txtItPremier.text,
                  'ir_sekunder': txtIrSekunder.text,
                  'is_sekunder': txtIsSekunder.text,
                  'it_sekunder': txtItSekunder.text,
                  'vr': txtVr.text,
                  'vs': txtVs.text,
                  'vt': txtVt.text,
                  'foto_phasor': imageUrl1,
                  'error_total': txtErrorTotal.text,
                  'foto_error_total': imageUrl2,
                  'error_kwh': txtErrorKwh.text,
                  'foto_error_kwh': imageUrl3,
                  'ctr': txtCtr.text,
                  'cts': txtCts.text,
                  'ctt': txtCtt.text,
                  'foto_error_ct': imageUrl4
                });
                if (txtIdPelanggan.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Id Pelanggan Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtNama.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Nama Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtTarif.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Tarif Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtDaya.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Daya Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtAlamat.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Alamat Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtTanggalPeriksa.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Tanggal Periksa Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtMerkKwh.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Merk Kwh Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtMerkCt.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Merk CT Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtRasioCt.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Rasio CT Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtKetBox.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Keterangan Box Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtIrPremier.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IR (Premier) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtIsPremier.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IS (Premier) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtItPremier.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IT (Premier) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtIrSekunder.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IR (Sekunder) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtIsSekunder.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IS (Sekunder) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtItSekunder.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'IT (Sekunder) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtVr.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'VR (Tegangan Uji) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtVs.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'VS (Tegangan Uji) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtVt.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'VT (Tegangan Uji) Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (imageUrl1 == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Foto Phasor Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtErrorTotal.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Error Total Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (imageUrl2 == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Foto Error Total Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtErrorKwh.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Error Kwh Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (imageUrl3 == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Foto Error Kwh Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtCtr.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'CTR Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtCts.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'CTS Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (txtCtt.text == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'CTT Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else if (imageUrl4 == '') {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Peringatan',
                    desc: 'Foto Error CT Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, InputDataScreen.routName);
                    },
                  ).show();
                } else {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    title: 'Sukses',
                    desc: 'Berhasil Menyimpan Data',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, HomeUserScreen.routName);
                    },
                  ).show();
                }
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildIdPelanggan() {
    return TextFormField(
      controller: txtIdPelanggan,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'ID PELANGGAN',
          hintText: 'Masukan ID PELANGGAN',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.event_available)),
    );
  }

  TextFormField buildNama() {
    return TextFormField(
      controller: txtNama,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'NAMA',
          hintText: 'Masukan NAMA',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.person)),
    );
  }

  TextFormField buildTarif() {
    return TextFormField(
      controller: txtTarif,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'TARIF',
          hintText: 'Masukan TARIF',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monetization_on)),
    );
  }

  TextFormField buildDaya() {
    return TextFormField(
      controller: txtDaya,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'DAYA',
          hintText: 'Masukan DAYA',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.flash_on)),
    );
  }

  TextFormField buildAlamat() {
    return TextFormField(
      controller: txtAlamat,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'ALAMAT',
          hintText: 'Masukan ALAMAT',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.location_on)),
    );
  }

  TextFormField buildTanggalPeriksa() {
    return TextFormField(
      controller: txtTanggalPeriksa,
      keyboardType: TextInputType.datetime,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'TANGGAL PERIKSA',
        hintText: 'Masukan TANGGAL PERIKSA',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.calendar_month),
      ),
      onTap: () async {
        DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));

        if (pickeddate != null) {
          setState(() {
            txtTanggalPeriksa.text = DateFormat.yMMMMd().format(DateTime.now());
          });
        }
      },
    );
  }

  TextFormField buildMerkKwh() {
    return TextFormField(
      controller: txtMerkKwh,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'MERK KWH',
          hintText: 'Masukan MERK KWH',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.money_outlined)),
    );
  }

  TextFormField buildMerkCt() {
    return TextFormField(
      controller: txtMerkCt,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'MERK CT',
          hintText: 'Masukan MERK CT',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.money_outlined)),
    );
  }

  TextFormField buildRasioCT() {
    return TextFormField(
      controller: txtRasioCt,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'RASIO CT',
          hintText: 'Masukan RASIO CT',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.flash_on)),
    );
  }

  TextFormField buildKetBox() {
    return TextFormField(
      controller: txtKetBox,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'KETERANGAN BOX',
          hintText: 'Masukan KETERANGAN BOX',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.checklist)),
    );
  }

  TextFormField buildIrPremier() {
    return TextFormField(
      controller: txtIrPremier,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IR (PREMIER)',
          hintText: 'Masukan IR (PREMIER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildIsPremier() {
    return TextFormField(
      controller: txtIsPremier,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IS (PREMIER)',
          hintText: 'Masukan IS (PREMIER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildItPremier() {
    return TextFormField(
      controller: txtItPremier,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IT (PREMIER)',
          hintText: 'Masukan IT (PREMIER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildIrSekunder() {
    return TextFormField(
      controller: txtIrSekunder,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IR (SEKUNDER)',
          hintText: 'Masukan IR (SEKUNDER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildIsSekunder() {
    return TextFormField(
      controller: txtIsSekunder,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IS (SEKUNDER)',
          hintText: 'Masukan IS (SEKUNDER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildItSekunder() {
    return TextFormField(
      controller: txtItSekunder,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'IT (SEKUNDER)',
          hintText: 'Masukan IT (SEKUNDER)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_outlined)),
    );
  }

  TextFormField buildVr() {
    return TextFormField(
      controller: txtVr,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'VR (TEGANGAN UJI)',
          hintText: 'Masukan VR (TEGANGAN UJI)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_rounded)),
    );
  }

  TextFormField buildVs() {
    return TextFormField(
      controller: txtVs,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'VS (TEGANGAN UJI)',
          hintText: 'Masukan VS (TEGANGAN UJI)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_rounded)),
    );
  }

  TextFormField buildVt() {
    return TextFormField(
      controller: txtVt,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'VT (TEGANGAN UJI)',
          hintText: 'Masukan VT (TEGANGAN UJI)',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(Icons.monitor_heart_rounded)),
    );
  }

  TextFormField buildErrorTotal() {
    return TextFormField(
      controller: txtErrorTotal,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'ERROR TOTAL',
          hintText: 'Masukan ERROR TOTAL',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildErrorKwh() {
    return TextFormField(
      controller: txtErrorKwh,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'ERROR KWH',
          hintText: 'Masukan ERROR KWH',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildCtr() {
    return TextFormField(
      controller: txtCtr,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'CTR',
          hintText: 'Masukan CTR',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildCts() {
    return TextFormField(
      controller: txtCts,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'CTS',
          hintText: 'Masukan CTS',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildCtt() {
    return TextFormField(
      controller: txtCtt,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'CTT',
          hintText: 'Masukan CTT',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  Future<void> fotoPhasor() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo1 = await picker.pickImage(source: ImageSource.camera);

    image1 = File(photo1!.path);

    if (image1 == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageTopUpload =
        referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageTopUpload.putFile(File(photo1.path));
      imageUrl1 = await referenceImageTopUpload.getDownloadURL();
    } catch (e) {}

    referenceImageTopUpload.putFile(File(photo1.path));

    setState(() {});
  }

  Future<void> fotoErrorTotal() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo2 = await picker.pickImage(source: ImageSource.camera);

    image2 = File(photo2!.path);

    if (image2 == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageTopUpload =
        referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageTopUpload.putFile(File(photo2.path));
      imageUrl2 = await referenceImageTopUpload.getDownloadURL();
    } catch (e) {}

    referenceImageTopUpload.putFile(File(photo2.path));

    setState(() {});
  }

  Future<void> fotoErrorKwh() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo3 = await picker.pickImage(source: ImageSource.camera);

    image3 = File(photo3!.path);

    if (image3 == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageTopUpload =
        referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageTopUpload.putFile(File(photo3.path));
      imageUrl3 = await referenceImageTopUpload.getDownloadURL();
    } catch (e) {}

    referenceImageTopUpload.putFile(File(photo3.path));

    setState(() {});
  }

  Future<void> fotoErrorCt() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo4 = await picker.pickImage(source: ImageSource.camera);

    image4 = File(photo4!.path);

    if (image4 == null) return;

    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageTopUpload =
        referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageTopUpload.putFile(File(photo4.path));
      imageUrl4 = await referenceImageTopUpload.getDownloadURL();
    } catch (e) {}

    referenceImageTopUpload.putFile(File(photo4.path));

    setState(() {});
  }
}
