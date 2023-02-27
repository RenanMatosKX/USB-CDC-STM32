import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nowgo/Transfer_Page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/usb_cdc_page.dart';
import 'package:nowgo/home_page.dart';
import 'package:nowgo/controller_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  void initApp() {
    Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ControllerPage()),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();

    initApp();
  }

  List<Widget> pages = const [HomePage(), USB_CDC_Page()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/Fundo01.png"),
          fit: BoxFit.cover,
        )),
        child: null,
      ),
    );
  }
}
