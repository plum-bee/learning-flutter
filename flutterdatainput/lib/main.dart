import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Input Text Getter',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  void _displayInputText(BuildContext context, String type) {
    final inputValue = myController.text;

    switch (type) {
      case 'simple':
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: const Center(
                    child: Text('SimpleDialog',
                        style: TextStyle(color: Colors.white))),
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                children: <Widget>[
                  Center(
                      child: Text(inputValue,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)))
                ],
              );
            });
        break;

      case 'alert':
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('AlertDialog',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: Text(inputValue,
                    style: const TextStyle(fontSize: 15, color: Colors.white)),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            });
        break;

      case 'snack':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              inputValue,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.teal,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        );
        break;

      case 'bottomSheet':
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Container(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(inputValue,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Close'),
                        )
                      ],
                    ),
                  ));
            });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Field Getter'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: myController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _displayInputText(context, 'simple'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Show in SimpleDialog'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _displayInputText(context, 'alert'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Show in AlertDialog'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _displayInputText(context, 'snack'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Show in SnackBar'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () =>
                          _displayInputText(context, 'bottomSheet'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Show in BottomSheet'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
