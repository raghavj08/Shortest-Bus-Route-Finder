import 'package:flutter/material.dart';

class Notes_Provider extends ChangeNotifier {
  List<String> _notes = [];

  List<String> get notes => _notes;

  void addNote(String note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
