import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';

class FilterOptionProvider with ChangeNotifier{

  int status = 0;

  int classIndex = 0;

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(Duration(days: 1));

  changeStatus(int status){
    this.status = status;
    notifyListeners();
  }

  changeClassIndex(int classIndex){
    this.classIndex = classIndex;
    notifyListeners();
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