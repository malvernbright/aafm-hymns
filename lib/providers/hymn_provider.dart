import 'package:flutter/foundation.dart';

class HymnProvider with ChangeNotifier {
  double myFontSize = 12.0;

  void increaseFontSize() {
    myFontSize++;
    notifyListeners();
  }

  void reduceFontSize() {
    myFontSize--;
    notifyListeners();
  }
}
