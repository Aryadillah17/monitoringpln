import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:monitoring/Components/default_button_custome_color.dart';
import 'package:monitoring/size_config.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TampilDataForm extends StatefulWidget {
  const TampilDataForm({
    Key? key,
  }) : super(key: key);
  @override
  _TampilDataForm createState() => _TampilDataForm();
}

class _TampilDataForm extends State<TampilDataForm> {
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

  String? imageUrl1 = '';
  String? imageUrl2 = '';
  String? imageUrl3 = '';
  String? imageUrl4 = '';

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
    return Form(
      child: Column(
        children: [
          ListTile(
            title: Text('ID PELANGGAN'),
            subtitle: Text('$idPelanggan'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('NAMA'),
            subtitle: Text('$nama'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('TARIF'),
            subtitle: Text('$tarif'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('DAYA'),
            subtitle: Text('$daya'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('ALAMAT'),
            subtitle: Text('$alamat'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('TANGGAL PERIKSA'),
            subtitle: Text('$tanggalPeriksa'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('MERK KWH'),
            subtitle: Text('$merkKwh'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('MERK CT'),
            subtitle: Text('$merkCt'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('RASIO CT'),
            subtitle: Text('$rasioCt'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('KETERANGAN BOX'),
            subtitle: Text('$ketBox'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IR PREMIER'),
            subtitle: Text('$irPremier'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IS PREMIER'),
            subtitle: Text('$isPremier'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IT PREMIER'),
            subtitle: Text('$itPremier'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IR SEKUNDER'),
            subtitle: Text('$irSekunder'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IS SEKUNDER'),
            subtitle: Text('$isSekunder'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('IT SEKUNDER'),
            subtitle: Text('$itSekunder'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('VR'),
            subtitle: Text('$vr'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('VS'),
            subtitle: Text('$vs'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('VT'),
            subtitle: Text('$vt'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('FOTO PHASOR'),
            subtitle: Image.network(
              '$foto_Phasor',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text('ERROR TOTAL'),
            subtitle: Text('$errorTotal'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('FOTO ERROR TOTAL'),
            subtitle: Image.network(
              '$foto_Error_Total',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text('ERROR KWH'),
            subtitle: Text('$errorKwh'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('FOTO ERROR KWH'),
            subtitle: Image.network(
              '$foto_Error_Kwh',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text('CTR'),
            subtitle: Text('$ctr'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('CTS'),
            subtitle: Text('$cts'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('CTT'),
            subtitle: Text('$ctt'),
            subtitleTextStyle: TextStyle(
                color: mTitleColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListTile(
            title: Text('FOTO ERROR CT'),
            subtitle: Image.network(
              '$foto_Error_Ct',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "UNDUH PDF",
            press: () async {
              final pdf = pw.Document();

              pdf.addPage(pw.Page(
                  pageFormat: PdfPageFormat.a4,
                  build: (pw.Context context) {
                    return pw.Center(
                      child: pw.Text("Simple Text"),
                    ); // Center
                  })); // Page

              Uint8List bytes = await pdf.save();

              final dir = await getApplicationDocumentsDirectory();
              final file = File('${dir.path}/mydoc.pdf');

              await file.writeAsBytes(bytes);
              await OpenFile.open(file.path);
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }
}
