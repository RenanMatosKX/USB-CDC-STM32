import 'package:flutter/material.dart';
import 'package:nowgo/controller_page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/usbDevices_page.dart';

int itemCount = 4;
bool stateLED12 = true;
bool stateLED13 = true;
bool stateLED14 = true;
bool stateLED15 = true;
bool stateDateSend = true;
bool stateDateReceived = true;
DateTime now = DateTime.now();
String dateHour = "17";
String dateMin = "04";
String dateSec = "55";
String dateDay = "17";
String dateMonth = "02";
String dateYear = "2023";

final dropValue = ValueNotifier('');
final dropBaudRate = ['2400','9600','19200','38400','57600','115200'];

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 242, 106, 75)),
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 185, 217),
        foregroundColor: Colors.white,
      ),

/*
      body: Column(
        children: [
         //Item 1 - Led 12 
          ListTile(
            title: Text('Baud rate'),
            subtitle: stateLED12 ? Text("115200") : Text('9600'),
            leading: const Icon(
              Icons.emoji_objects,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.power_settings_new,
              size: 50.0,
            ),
            //iconColor: Colors.amber,
            iconColor: stateLED12 ? Colors.grey : Colors.greenAccent,

            onTap: () {
              setState(() => stateLED12 = !stateLED12);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
         //Item 2 - LED 13
          ListTile(
            title: Text('Data bits'),
             subtitle: stateLED13 ? Text("Desligado") : Text('Ligado'),
            leading: const Icon(
              Icons.emoji_objects,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.power_settings_new,
              size: 50.0,
            ),
            iconColor: stateLED13 ? Colors.grey : Colors.orangeAccent,
            onTap: () {
              setState(() => stateLED13 = !stateLED13);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
         // Item 3 - LED 14
          ListTile(
            title: Text('Parity'),
             subtitle: stateLED14 ? Text("Desligado") : Text('Ligado'),
            leading: const Icon(
              Icons.emoji_objects,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.power_settings_new,
              size: 50.0,
            ),
              iconColor: stateLED14 ? Colors.grey : Colors.redAccent,
            onTap: () {
               setState(() => stateLED14 = !stateLED14);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
         
         // Item 4 - LED 15 
          ListTile(
            title: Text('Stop bits'),
           subtitle: stateLED15 ? Text("Desligado") : Text('Ligado'),
            leading: const Icon(
              Icons.emoji_objects,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.power_settings_new,
              size: 50.0,
            ),
              iconColor: stateLED15 ? Colors.grey : Colors.lightBlue,
            onTap: () {
               setState(() => stateLED15 = !stateLED15);
              debugPrint('Item ${(1 + 1)}');
            },
          ),


        ],   

      ),
*/
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: dropValue, builder:(BuildContext context, String value, _){
              return SizedBox(
                width: 320,
                child: DropdownButtonFormField<String>(
                  
                isExpanded: true,
                 icon: const Icon(Icons.drive_eta),
                 hint: const Text('9600'),
                 decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    )
                 ) ,
                  value: (value.isEmpty) ? null:value,
                  onChanged: (escolha) => dropValue.value = escolha.toString(),
                  items: dropBaudRate.map((op) => DropdownMenuItem(
                    value: op,
                    child: Text(op),
                    ),).toList(),
                 ),
              );
          }),
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
