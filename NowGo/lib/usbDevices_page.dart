import 'package:flutter/material.dart';
import 'package:nowgo/controller_page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/setting_page.dart';
import 'package:usb_serial/usb_serial.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

int itemCount = 20;
bool enabledReflesh = true;

class usbDevicePage extends StatefulWidget {
  const usbDevicePage({super.key});

  @override
  State<usbDevicePage> createState() => _usbDevicePageState();
}

class _usbDevicePageState extends State<usbDevicePage> {
  var portsUSB = <String, List> { };
  List<Widget> _ports = [];
  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  void _getPorts() async {
    portsUSB.clear();
    portsUSB['1905'] = ['STM32 Virtual Comport','STMicrocontrolers','1234','5678'];
    portsUSB['1906'] = ['STM32 Virtual Comport','STMicrocontrolers','1234','5678'];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    devices.forEach((device) {
       portsUSB[device.deviceId.toString()] = [device.productName!, device.manufacturerName!, device.pid.toString() , device.vid.toString()];
    });
    setState(() {
      print(portsUSB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Container(
            width: 100,
            child:
             ElevatedButton(onPressed: (){
                _getPorts();
             }, 
             child: 
             Icon(
              Icons.refresh,
              color: enabledReflesh ? Colors.orange : Colors.grey,
                 size: 30.0,
              )),
            
          )
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(255, 242, 106, 75)),
        title: Text('USB Devices'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 185, 217),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
        
          ListTile(
            title: Text('Item $portsUSB'),
            leading: const Icon((Icons.person)),
            trailing: const Icon(Icons.select_all),
            onTap: () {
              debugPrint('Item $portsUSB');
            },
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index){
              return Card(
                child: Text("Renan"), 
              );
            }), 

            separatorBuilder: (__, _) => const Divider(), 
            itemCount: portsUSB.length)
        ],
        
      ),

      //Menu Lateral
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 64, 64, 64),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("USB CDC Tester"),
              accountEmail: Text("www.karimex.com.br"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.usb, size: 40.0),
                backgroundColor: Colors.white,
              ),
            ),

            //Controller
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.toggle_off),
              title: Text("Controller"),
              onTap: () {
                //Navigator.pop(context);

                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ControllerPage()),
                  );
                });
              },
            ),
            //USB Devices
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.cable),
              title: Text("USB Devices"),
              onTap: () {
                // Navigator.pop(context);

                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => usbDevicePage()),
                  );
                });
              },
            ),
            //Settings
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                // Navigator.pop(context);
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                });
              },
            ),
            //Info
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.info),
              title: Text("Info"),
              onTap: () {
                //  Navigator.pop(context);
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
