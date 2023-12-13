import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monitoring/Screens/User/Crud/EditDataScreen.dart';
import 'package:monitoring/Screens/User/Crud/TampilDataScreen.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class HomeUserComponent extends StatefulWidget {
  final Map? item;
  const HomeUserComponent({
    Key? key,
    this.item,
  }) : super(key: key);
  @override
  _HomeUserComponent createState() => _HomeUserComponent();
}

class _HomeUserComponent extends State<HomeUserComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (!snapshot.hasData) return const Text("Memuat Data");
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.docs.length,
                      itemBuilder: (context, index) {
                        var item = data.docs[index].data() as Map;
                        item['id'] = data.docs[index].id;

                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TampilDataScreen.routName,
                                arguments: {
                                  'item': item['id'],
                                  'idPelanggan': item['id_pelanggan'],
                                  'nama': item['nama'],
                                  'tarif': item['tarif'],
                                  'daya': item['daya'],
                                  'alamat': item['alamat'],
                                  'tanggalPeriksa': item['tanggal_periksa'],
                                  'merkKwh': item['merk_kwh'],
                                  'merkCt': item['merk_ct'],
                                  'rasioCt': item['rasio_ct'],
                                  'ketBox': item['ket_box'],
                                  'irPremier': item['ir_premier'],
                                  'isPremier': item['is_premier'],
                                  'itPremier': item['it_premier'],
                                  'irSekunder': item['ir_sekunder'],
                                  'isSekunder': item['is_sekunder'],
                                  'itSekunder': item['it_sekunder'],
                                  'vr': item['vr'],
                                  'vs': item['vs'],
                                  'vt': item['vt'],
                                  'fotoPhasor': item['foto_phasor'],
                                  'errorTotal': item['error_total'],
                                  'fotoErrorTotal': item['foto_error_total'],
                                  'errorKwh': item['error_kwh'],
                                  'fotoErrorKwh': item['foto_error_kwh'],
                                  'ctr': item['ctr'],
                                  'cts': item['cts'],
                                  'ctt': item['ctt'],
                                  'fotoErrorCt': item['foto_error_ct']
                                });
                          },
                          child: Card(
                            elevation: 10.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 5.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 15.0),
                                  leading: Container(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white24))),
                                    child: Image.network(item['foto_phasor']),
                                  ),
                                  title: Text(
                                    item['id_pelanggan'],
                                    style: const TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    item['nama'],
                                    style: const TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                EditDataScreen.routName,
                                                arguments: {
                                                  'item': item['id'],
                                                  'idPelanggan':
                                                      item['id_pelanggan'],
                                                  'nama': item['nama'],
                                                  'tarif': item['tarif'],
                                                  'daya': item['daya'],
                                                  'alamat': item['alamat'],
                                                  'tanggalPeriksa':
                                                      item['tanggal_periksa'],
                                                  'merkKwh': item['merk_kwh'],
                                                  'merkCt': item['merk_ct'],
                                                  'rasioCt': item['rasio_ct'],
                                                  'ketBox': item['ket_box'],
                                                  'irPremier':
                                                      item['ir_premier'],
                                                  'isPremier':
                                                      item['is_premier'],
                                                  'itPremier':
                                                      item['it_premier'],
                                                  'irSekunder':
                                                      item['ir_sekunder'],
                                                  'isSekunder':
                                                      item['is_sekunder'],
                                                  'itSekunder':
                                                      item['it_sekunder'],
                                                  'vr': item['vr'],
                                                  'vs': item['vs'],
                                                  'vt': item['vt'],
                                                  'fotoPhasor':
                                                      item['foto_phasor'],
                                                  'errorTotal':
                                                      item['error_total'],
                                                  'fotoErrorTotal':
                                                      item['foto_error_total'],
                                                  'errorKwh': item['error_kwh'],
                                                  'fotoErrorKwh':
                                                      item['foto_error_kwh'],
                                                  'ctr': item['ctr'],
                                                  'cts': item['cts'],
                                                  'ctt': item['ctt'],
                                                  'fotoErrorCt':
                                                      item['foto_error_ct']
                                                });
                                          },
                                          child: const Icon(Icons.edit)),
                                      const SizedBox(
                                        width: 0.0,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            final docUser = FirebaseFirestore
                                                .instance
                                                .collection('users')
                                                .doc(item['id']);

                                            docUser.delete();
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
