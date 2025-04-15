import 'package:flutter/material.dart';
import 'package:notes_app/Second.dart';
import 'package:notes_app/notes_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> note = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<Notes_Provider>(
      builder:
          (context, notes_provider, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'My Notes App',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            body:
                notes_provider.notes.isEmpty
                    ? Center(child: Text('Nothing here yet'))
                    : SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: notes_provider.notes.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: EdgeInsets.all(15),
                                  elevation: 4,
                                  child: Container(
                                    height: 100,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(notes_provider.notes[index]),
                                          IconButton(
                                            onPressed: () {
                                              notes_provider.deleteNote(index);
                                            },
                                            icon: Icon(Icons.delete,color: Colors.red,),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Second()),
                );
              },
              tooltip: 'Add New Note',
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
    );
  }
}
