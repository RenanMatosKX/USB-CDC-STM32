import 'package:flutter/material.dart';
import 'package:nowgo/Transfer_Page.dart';
import 'package:nowgo/init_page.dart';
import 'package:nowgo/setting_page.dart';
import 'package:nowgo/usbDevices_page.dart';

import 'controller_page.dart';
int itemCount = 4;
bool stateLED12 = false;
bool stateLED13 = false;
bool stateLED14 = false;
bool stateLED15 = false;

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 242, 106, 75)),
        title: Text('Info'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 185, 217),
        foregroundColor: Colors.white,
      ),


      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Text("Contact\r\n\r\nwww.karimex.com.br\r\n\r\nDennys Ramos PAEZ\r\nEngenheiro de Aplicações (FAE)\r\ndennys.ramos@karimex.com.br\r\n(11)5189-1947  / (11) 98684-9087\r\n\r\nFelipe Yoshino Barros\r\nEngenheiro de Aplicações (FAE)\r\nfelipe.barros@karimex.com.br\r\n(11)5189-1973\r\n\r\nRenan Araujo de Matos\r\nEngenheiro de Aplicações (FAE)\r\nrenan.matos@karimex.com.br\r\n(11)5189-1905  / (11) 98450-7844\r\n\r\nKarimex Componentes Eletrônicos Ltda\r\nRua Américo Brasiliense, 2444 - Chácara Santo Antônio \r\n\r\nSão Paulo - SP - Brasil - 04715-005"),
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
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ControllerPage()),
                  );

              },
            ),
            //USB Devices
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.cable),
              title: Text("USB Devices"),
              onTap: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => usbDevicePage()),
                  );

              },
            ),
            //Settings
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage(


                    )),
                  );

              },
            ),
            //Info
             ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.info),
              title: Text("Info"),
               onTap: () {
               // Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage()),
                  );

              },
            ),
          ],
        ),
      ),
    
    
    );
  }
}