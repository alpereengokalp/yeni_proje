import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCheckBoxApp(),
    );
  }
}

class MyCheckBoxApp extends StatefulWidget {
  @override
  _MyCheckBoxAppState createState() => _MyCheckBoxAppState();
}

class _MyCheckBoxAppState extends State<MyCheckBoxApp> {
  List<bool> isCheckedList = [
    false,
    false,
    false
  ]; // Checkbox durumlarını tutan liste

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Checkbox Example'),
      ),
      body: ListView.builder(
        itemCount: isCheckedList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
            trailing: Checkbox(
              value: isCheckedList[index],
              onChanged: (value) {
                setState(() {
                  isCheckedList[index] = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
