import 'package:flutter/material.dart';
import 'package:nowgo/controller_page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/setting_page.dart';
import 'package:usb_serial/usb_serial.dart';
int itemCount = 20;
bool enabledReflesh = false;

class usbDevicePage extends StatefulWidget {
  const usbDevicePage({super.key});

  @override
  State<usbDevicePage> createState() => _usbDevicePageState();
}

class _usbDevicePageState extends State<usbDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         actions: [
          Container(
            width: 100,
            child: Icon(
              Icons.refresh,
              color: enabledReflesh ? Colors.orange : Colors.grey,
              size: 30.0,
            ),
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
                  title: Text('Item ${(1+1)}'),
                  leading: const Icon((Icons.person)),
                  trailing: const Icon(Icons.select_all),
                  onTap: (){
                    debugPrint('Item ${(1+1)}');
                  },
                ),


        ],
      )
      ,
   
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
