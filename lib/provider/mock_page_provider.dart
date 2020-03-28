import 'package:flutter/material.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';

class MockPageProvider with ChangeNotifier{
  STSSuitListModel mockSuitListModel;
  int mockPage = 1;
  int mockPageSize = 10;

  DateTime selectedStartDate = DateTime.now();

  DateTime selectedEndDate = DateTime.now().add(Duration(days: 1));

  int status = 0;

  void updateMockSuitListModel(STSSuitListModel suitListModel) {
    this.mockSuitListModel = suitListModel;
  }

  changeSelectedStartDate(DateTime selectedStartDate){
    this.selectedStartDate = selectedStartDate;
    notifyListeners();
  }

  changeSelectedEndDate(DateTime selectedEndDate){
    this.selectedEndDate = selectedEndDate;
    notifyListeners();
  }
}