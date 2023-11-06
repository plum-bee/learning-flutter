import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterforms/src/forms/vehicle_form.dart';
import 'package:flutterforms/src/forms/stepped_form.dart';
import 'package:flutterforms/src/forms/cat_form.dart';
import 'package:flutterforms/src/forms/computer_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Builder',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Complete Form', style: TextStyle(fontSize: 18)),
            trailing:
                const Icon(Icons.arrow_right_sharp, color: Colors.blueGrey),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VehicleForm(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Stepped Form', style: TextStyle(fontSize: 18)),
            trailing:
                const Icon(Icons.arrow_right_sharp, color: Colors.blueGrey),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SteppedForm(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Cat Form', style: TextStyle(fontSize: 18)),
            trailing:
                const Icon(Icons.arrow_right_sharp, color: Colors.blueGrey),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CatForm(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Computer Form', style: TextStyle(fontSize: 18)),
            trailing:
                const Icon(Icons.arrow_right_sharp, color: Colors.blueGrey),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ComputerPartForm(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
