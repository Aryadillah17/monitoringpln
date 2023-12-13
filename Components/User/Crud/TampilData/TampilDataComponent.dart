import 'package:flutter/material.dart';
import 'package:monitoring/Components/User/Crud/TampilData/TampilDataForm.dart';
import 'package:monitoring/Utils/constans.dart';
import 'package:monitoring/size_config.dart';

class TampilDataComponent extends StatefulWidget {
  const TampilDataComponent({Key? key}) : super(key: key);

  @override
  _TampilDataComponent createState() => _TampilDataComponent();
}

class _TampilDataComponent extends State<TampilDataComponent> {
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
                          "DATA HASIL MONITORING",
                          style: mTitleStyle,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const TampilDataForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
