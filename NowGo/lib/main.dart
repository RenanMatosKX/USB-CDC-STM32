import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nowgo/home_page.dart';
import 'package:nowgo/profile_page.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const[
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karimex - USB CDC'),
        centerTitle: true,
        foregroundColor: Colors.white,
           leading: const Icon(Icons.usb_rounded, size: 40.0,),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label:'Home'),
          NavigationDestination(icon: Icon(Icons.person), label:'Profile'),
          ],
          onDestinationSelected: (int index){
            setState(() {
                currentPage = index;
            });
          
          },
          selectedIndex:  currentPage,
          ),

    );
  }
}
