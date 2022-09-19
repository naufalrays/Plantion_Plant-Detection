import 'package:flutter/material.dart';
import 'package:tflite_image_classification/constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: Center(
          child: Text(
        "Setting Screen",
        style: TextStyle(fontSize: 40, color: kPrimaryColor),
      )),
    );
  }
}
