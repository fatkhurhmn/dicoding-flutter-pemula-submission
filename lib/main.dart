import 'package:dinggo_id/views/main_page.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff022450);
const Color bgColor = Color(0xfff1f4f9);
const Color cardColor = Color(0xffffffff);
const Color loadingColor = Color(0xffd6d6d6);
const Color priceColor = Color(0xfff17300);

const TextStyle myTextStyle = TextStyle(
  fontFamily: "Nunito",
  fontSize: 15,
  color: Colors.black87,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
