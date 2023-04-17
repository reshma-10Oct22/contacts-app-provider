import 'package:flutter/material.dart';

class TabIndexProviderClass with ChangeNotifier {
  int _tabIndex = 1;

  int get tabIndex => _tabIndex;

  void setTabIndex(int newTabIndex) {
    _tabIndex = newTabIndex;
    notifyListeners();
  }
}
