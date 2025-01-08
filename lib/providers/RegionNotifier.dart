import 'package:flutter/material.dart';

class RegionNotifier extends ChangeNotifier {

  String? selectedSpot;
  String? selectedRid;

  void updateSelectedSpot(String? value, String? rid) {
    selectedSpot = value;
    selectedRid = rid;
    notifyListeners();
  }



}