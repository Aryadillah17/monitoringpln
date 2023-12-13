import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/InputData/InputDataForm.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class InputDataComponent extends StatefulWidget {
  const InputDataComponent({Key? key}) : super(key: key);
  @override
  _InputDataComponent createState() => _InputDataComponent();
}

class _InputDataComponent extends State<InputDataComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Input Data KWH !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const FormInputData()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
