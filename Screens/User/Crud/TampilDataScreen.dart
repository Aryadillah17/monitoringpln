import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/TampilData/TampilDataComponent.dart';
import 'package:monitoring/Utils/constans.dart';

class TampilDataScreen extends StatelessWidget {
  static String routName = "/tampil_data_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        title: const Text(
          "DATA MONITORING",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: const TampilDataComponent(),
    );
  }
}
