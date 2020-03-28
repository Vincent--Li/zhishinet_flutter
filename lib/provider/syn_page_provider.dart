import 'package:flutter/material.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';

class SynPageProvider with ChangeNotifier{
  STSSuitListModel syncSuitListModel = STSSuitListModel();
  int syncPage = 1;
  int syncPageSize = 10;

  DateTime selectedStartDate = DateTime.now();

  DateTime selectedEndDate = DateTime.now().add(Duration(days: 1));

  int status = 0;

  void updateSyncSuitListModel(STSSuitListModel suitListModel) {
    this.syncSuitListModel = suitListModel;
    notifyListeners();
  }

  changeSelectedStartDate(DateTime selectedStartDate){
    this.selectedStartDate = selectedStartDate;
  }

  changeSelectedEndDate(DateTime selectedEndDate){
    this.selectedEndDate = selectedEndDate;
  }

  void changeStatus(int status) {
    this.status = status;
  }
}