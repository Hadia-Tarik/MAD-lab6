 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Names List'),
        ),
        body: NamesListView(),
      ),
    );
  }
}

class NamesListView extends StatefulWidget {
  @override
  _NamesListViewState createState() => _NamesListViewState();
}

class _NamesListViewState extends State<NamesListView> {
  final List<String> names = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eva',
    'Frank',
    'Grace',
    'Hank',
    'Ivy',
    'Jack',
    'Kelly',
    'Leo',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(names[index]),
          onTap: () => _showConfirmationDialog(index),
        );
      },
    );
  }

  void _showConfirmationDialog(int index) async {
    bool confirm = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Do you want to remove ${names[index]}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true on "Yes"
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false on "No"
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      // Remove the selected item from the list
      setState(() {
        names.removeAt(index);
      });
    }
  }
}
