import 'package:flutter/material.dart';
import 'package:nowgo/controller_page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/init_page.dart';
import 'package:nowgo/Transfer_Page.dart';
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


class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Container(
            width: 100,
            child: Icon(
              Icons.usb_off,
              color: Colors.grey,
              size: 30.0,
            ),
          )
        ],
        iconTheme: IconThemeData(color: Color.fromARGB(255, 242, 106, 75)),
        title: Text('Controller'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 185, 217),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
         //Item 1 - Led 12 
          ListTile(
            title: Text('LED 12 - Verde'),
            subtitle: stateLED12 ? Text("Desligado") : Text('Ligado'),
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
            title: Text('LED 13 - Laranja'),
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
            title: Text('LED 14 - Vermelho'),
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
            title: Text('LED 15 - Azul'),
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
        // Item 5 - DateTime - Send
                    ListTile(
            title: stateDateSend ?  Text('Date Time hh:mm:ss - dd/mm/yyyy'):Text('Date Time ' + dateHour + ":" + dateMin + ":" + dateSec + "-" + dateDay + "/" + dateMonth + "/" + dateYear),
           subtitle: stateDateReceived ? Text("") : Text('Enviado com Sucesso!'),
            leading: const Icon(
              Icons.schedule,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.send,
              size: 30.0,
            ),
              iconColor: stateDateSend ? Colors.grey : Colors.cyanAccent,
            onTap: () {
               setState(() { 
                stateDateSend = false;
                dateHour = now.hour.toString();
                dateMin = now.minute.toString();
                dateSec = now.second.toString();
                dateDay = now.day.toString();
                dateMonth = now.month.toString();
                dateYear = now.year.toString();

                });
              debugPrint('Item ${(1 + 1)}');
            },
          ),

            // Item 6  - DateTime - Echo
                    ListTile(
           title: stateDateReceived ?  Text('Date Time hh:mm:ss - dd/mm/yyyy'):Text('Date Time ' + dateHour + ":" + dateMin + ":" + dateSec + "-" + dateDay + "/" + dateMonth + "/" + dateYear),
           subtitle: stateDateReceived ? Text("") : Text('Recebido com Sucesso!'),
            leading: const Icon(
              Icons.schedule,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.call_received,
              size: 30.0,
            ),
              iconColor: stateDateReceived ? Colors.grey : Colors.pinkAccent,
            
            /*onTap: () {
               setState(() { stateDateReceived = !stateDateReceived;  stateDateSend = !stateDateSend;});
              debugPrint('Item ${(1 + 1)}');
            },*/

          ),
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
                    MaterialPageRoute(builder: (context) => ControllerPage()),
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
