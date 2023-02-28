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

final dropValue1 = ValueNotifier('');
final dropValue2 = ValueNotifier('');
final dropValue3 = ValueNotifier('');
final dropValue4 = ValueNotifier('');
final dropBaudRate = ['2400', '9600', '19200', '38400', '57600', '115200'];
final dropDatabits = ['5', '6', '7', '8'];
final dropParity = ['None', 'Odd', 'Even'];
final dropStopBits = ['1', '1.5', '2'];

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

      body: Column(
        children: [
          //Label Data bits
          SizedBox(
            width: 320,
            height: 50,
            child: Row(
              children: [
                Text('Baud Rate:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          //DropDownMenu BaudRate
          Center(
                        heightFactor: 0.7,
            child: ValueListenableBuilder(
                valueListenable: dropValue1,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 320,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text('9600'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          dropValue1.value = escolha.toString(),
                      items: dropBaudRate
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
          ),

          //Label Data bits
          SizedBox(
            width: 320,
            height: 50,
            child: Row(
              children: [
                Text('Data bits:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          //DropDownMenu Data bits
          Center(
            heightFactor: 0.7,
            child: ValueListenableBuilder(
                valueListenable: dropValue2,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 320,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text('8'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          dropValue2.value = escolha.toString(),
                      items: dropDatabits
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
          ),

          //Label Parity
          SizedBox(
            width: 320,
            height: 50,
            child: Row(
              children: [
                Text('Parity: ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          //DropDownMenu Data bits
          Center(
            heightFactor: 0.7,
            child: ValueListenableBuilder(
                valueListenable: dropValue3,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 320,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text('None'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          dropValue3.value = escolha.toString(),
                      items: dropParity
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
          ),

          //Label Stop Bits
          SizedBox(
            width: 320,
            height: 50,
            child: Row(
              children: [
                Text('Stop bits:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          //DropDownMenu Data bits
          Center(
                        heightFactor: 0.7,
            child: ValueListenableBuilder(
                valueListenable: dropValue4,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    width: 320,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      hint: const Text('8'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      )),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          dropValue4.value = escolha.toString(),
                      items: dropStopBits
                          .map(
                            (op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),
          ),

          Center(
            heightFactor: 2,
            child: TextButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(200, 70)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  if(dropValue1.value == '9600'){
                      debugPrint('Baud Rate Selected : 9600');
                  }
                },
                child:
                 Text('Save Settings')),
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
