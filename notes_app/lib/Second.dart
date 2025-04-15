import 'package:flutter/material.dart';
import 'package:notes_app/notes_provider.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  Second({super.key});
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController _Textcontroller = new TextEditingController();

  void addNote(BuildContext context) {
    final text = _Textcontroller.text.trim();
    if (text.isNotEmpty) {
      Provider.of<Notes_Provider>(context, listen: false).addNote(text);
      _Textcontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (context, notes_provider, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'My Notes App',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 235, 235),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Enter your note here',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 100),
                      SizedBox(
                        width: 300,
                        child: TextField(controller: _Textcontroller),
                      ),
                      SizedBox(height: 80),
                      ElevatedButton(
                        onPressed: () {
                          addNote(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
