import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monitoring/Components/custom_surfix_icon.dart';
import 'package:monitoring/Components/default_button_custome_color.dart';
import 'package:monitoring/size_config.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:intl/intl.dart';

import '../../../../Screens/User/HomeUserScreen.dart';

class EditDataForm extends StatefulWidget {
  const EditDataForm({
    Key? key,
  }) : super(key: key);
  @override
  _EditDataForm createState() => _EditDataForm();
}

class _EditDataForm extends State<EditDataForm> {
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

  var item;
  var idPelanggan;
  var nama;
  var tarif;
  var daya;
  var alamat;
  var tanggalPeriksa;
  var merkKwh;
  var merkCt;
  var rasioCt;
  var ketBox;
  var irPremier;
  var isPremier;
  var itPremier;
  var irSekunder;
  var isSekunder;
  var itSekunder;
  var vr;
  var vs;
  var vt;
  var foto_Phasor;
  var errorTotal;
  var foto_Error_Total;
  var errorKwh;
  var foto_Error_Kwh;
  var ctr;
  var cts;
  var ctt;
  var foto_Error_Ct;

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != true) {
      item = arguments['item'];
      idPelanggan = arguments['idPelanggan'];
      nama = arguments['nama'];
      tarif = arguments['tarif'];
      daya = arguments['daya'];
      alamat = arguments['alamat'];
      tanggalPeriksa = arguments['tanggalPeriksa'];
      merkKwh = arguments['merkKwh'];
      merkCt = arguments['merkCt'];
      rasioCt = arguments['rasioCt'];
      ketBox = arguments['ketBox'];
      irPremier = arguments['irPremier'];
      isPremier = arguments['isPremier'];
      itPremier = arguments['itPremier'];
      irSekunder = arguments['irSekunder'];
      isSekunder = arguments['isSekunder'];
      itSekunder = arguments['itSekunder'];
      vr = arguments['vr'];
      vs = arguments['vs'];
      vt = arguments['vt'];
      foto_Phasor = arguments['fotoPhasor'];
      errorTotal = arguments['errorTotal'];
      foto_Error_Total = arguments['fotoErrorTotal'];
      errorKwh = arguments['errorKwh'];
      foto_Error_Kwh = arguments['fotoErrorKwh'];
      ctr = arguments['ctr'];
      cts = arguments['cts'];
      ctt = arguments['ctt'];
      foto_Error_Ct = arguments['fotoErrorCt'];
    }
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
              ? Image.network('$foto_Phasor',
                  width: 250, height: 250, fit: BoxFit.cover)
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
              ? Image.network('$foto_Error_Total',
                  width: 250, height: 250, fit: BoxFit.cover)
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
              ? Image.network('$foto_Error_Kwh',
                  width: 250, height: 250, fit: BoxFit.cover)
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
              ? Image.network('$foto_Error_Ct',
                  width: 250, height: 250, fit: BoxFit.cover)
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
                users
                    .doc(item)
                    .update({
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
                    })
                    .then((value) => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'Sukses',
                          desc: 'Berhasil Mengedit Data',
                          btnOkOnPress: () {
                            Navigator.pushNamed(
                                context, HomeUserScreen.routName);
                          },
                        ).show())
                    .catchError((error) => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'ERROR',
                          desc: 'Terjadi Kesalahan',
                          btnOkOnPress: () {
                            Navigator.pushNamed(
                                context, HomeUserScreen.routName);
                          },
                        ).show());
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
      controller: txtIdPelanggan..text = '$idPelanggan',
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
      controller: txtNama..text = '$nama',
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
      controller: txtTarif..text = '$tarif',
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
      controller: txtDaya..text = '$daya',
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
      controller: txtAlamat..text = '$alamat',
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
      controller: txtTanggalPeriksa..text = '$tanggalPeriksa',
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
      controller: txtMerkKwh..text = '$merkKwh',
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
      controller: txtMerkCt..text = '$merkCt',
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
      controller: txtRasioCt..text = '$rasioCt',
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
      controller: txtKetBox..text = '$ketBox',
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
      controller: txtIrPremier..text = '$irPremier',
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
      controller: txtIsPremier..text = '$isPremier',
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
      controller: txtItPremier..text = '$itPremier',
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
      controller: txtIrSekunder..text = '$irSekunder',
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
      controller: txtIsSekunder..text = '$isSekunder',
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
      controller: txtItSekunder..text = '$itSekunder',
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
      controller: txtVr..text = '$vr',
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
      controller: txtVs..text = '$vs',
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
      controller: txtVt..text = '$vt',
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
      controller: txtErrorTotal..text = '$errorTotal',
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
      controller: txtErrorKwh..text = '$errorKwh',
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
      controller: txtCtr..text = '$ctr',
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
      controller: txtCts..text = '$cts',
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
      controller: txtCtt..text = '$ctt',
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
