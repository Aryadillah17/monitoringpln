import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/InputData/InputDataComponent.dart';
import 'package:monitoring/Utils/constans.dart';

class InputDataScreen extends StatelessWidget {
  static String routName = "/input_data_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        title: const Text(
          "Input Data KWH",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: const InputDataComponent(),
    );
  }
}
