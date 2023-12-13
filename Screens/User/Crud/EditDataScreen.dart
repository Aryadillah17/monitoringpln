import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/EditData/EditDataComponent.dart';
import 'package:monitoring/Utils/constans.dart';

class EditDataScreen extends StatelessWidget {
  static String routName = "/edit_data_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        title: const Text(
          "Edit Data KWH",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: const EditDataComponent(),
    );
  }
}
