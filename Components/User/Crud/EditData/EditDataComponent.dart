import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/EditData/EditDataForm.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class EditDataComponent extends StatefulWidget {
  const EditDataComponent({Key? key}) : super(key: key);

  @override
  _EditDataComponent createState() => _EditDataComponent();
}

class _EditDataComponent extends State<EditDataComponent> {
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
                          "Edit Data KWH !",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const EditDataForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
