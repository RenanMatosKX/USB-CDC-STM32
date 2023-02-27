import 'package:flutter/material.dart';
import 'package:nowgo/controller_page.dart';
import 'package:nowgo/info_page.dart';
import 'package:nowgo/init_page.dart';

int itemCount = 4;
bool stateLED12 = false;
bool stateLED13 = false;
bool stateLED14 = false;
bool stateLED15 = false;

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  showAlertDialog(BuildContext context) {
    // Create button
    // Create AlertDialog

    AlertDialog alert = AlertDialog(
      title: Text("Transferindo dados para o STM32"),
      content: Text("Tranferência realizada com sucesso!"),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'OK',
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
        title: Text('Transfer Data'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 106, 185, 217),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          ListTile(
            title: Text('Dados01.txt'),
            subtitle:
                stateLED12 ? Text("Não Transferido") : Text('Transferido'),
            leading: const Icon(
              Icons.description,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.downloading_sharp,
              size: 50.0,
            ),
            //iconColor: Colors.amber,
            iconColor: stateLED12 ? Colors.grey : Colors.greenAccent,

            onTap: () {
              setState(() => stateLED12 = !stateLED12);
              showAlertDialog(context);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
          ListTile(
            title: Text('Dados02.txt'),
            subtitle:
                stateLED13 ? Text("Não Transferido") : Text('Transferido'),
            leading: const Icon(
              Icons.description,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.downloading_sharp,
              size: 50.0,
            ),
            iconColor: stateLED13 ? Colors.grey : Colors.orangeAccent,
            onTap: () {
              setState(() => stateLED13 = !stateLED13);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
          ListTile(
            title: Text('Dados03.txt'),
            subtitle:
                stateLED14 ? Text("Não Transferido") : Text('Transferido'),
            leading: const Icon(
              Icons.description,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.downloading_sharp,
              size: 50.0,
            ),
            iconColor: stateLED14 ? Colors.grey : Colors.redAccent,
            onTap: () {
              setState(() => stateLED14 = !stateLED14);
              debugPrint('Item ${(1 + 1)}');
            },
          ),
          ListTile(
            title: Text('Dados04.txt'),
            subtitle:
                stateLED15 ? Text("Não Transferido") : Text('Transferido'),
            leading: const Icon(
              Icons.description,
              size: 60.0,
            ),
            trailing: const Icon(
              Icons.downloading_sharp,
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
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.terminal),
              title: Text("Terminal"),
              onTap: () {
                //  Navigator.pop(context);

                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InitPage()),
                  );
                });
              },
            ),
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
            ListTile(
              textColor: Color.fromARGB(255, 255, 255, 255),
              iconColor: Color.fromARGB(255, 255, 255, 255),
              leading: Icon(Icons.upload_file),
              title: Text("Transfer Data"),
              onTap: () {
                //  Navigator.pop(context);

                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransferPage()),
                  );
                });
              },
            ),
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
                    MaterialPageRoute(builder: (context) => ControllerPage()),
                  );
                });
              },
            ),
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
