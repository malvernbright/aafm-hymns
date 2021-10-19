import 'package:flutter/material.dart';

class HymnProvider with ChangeNotifier {
  double myFontSize = 12.0;
  TextEditingController editingController = TextEditingController();
  List itemSearch = [];

  int selectedIndex = 0;

  void increaseFontSize() {
    myFontSize++;
    notifyListeners();
  }

  void reduceFontSize() {
    myFontSize--;
    notifyListeners();
  }

  // selectedIndex: _selectedIndex,
  // onTabChange: (index) {
  // setState(() {
  // _selectedIndex = index;
  // });

  void onTabChanged(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
