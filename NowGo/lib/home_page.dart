import 'package:flutter/material.dart';
import 'package:nowgo/learn_flutter_page.dart';
import 'package:nowgo/usb_cdc_page.dart';
import 'package:nowgo/init_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(

          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return InitPage();
              }),
            );
          },
          
          child: const Text(
            'Init',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
            )),
          

    );
  }
}
