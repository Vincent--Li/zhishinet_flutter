import 'package:flutter/material.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';

class AssessmentPageProvider with ChangeNotifier{

  //共用
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(Duration(days: 1));
  int status = 0;

  changeSelectedStartDate(DateTime selectedStartDate){
    this.selectedStartDate = selectedStartDate;
  }

  changeSelectedEndDate(DateTime selectedEndDate){
    this.selectedEndDate = selectedEndDate;
  }

  void changeStatus(int status) {
    this.status = status;
  }

  //同步
  STSSuitListModel syncSuitListModel = STSSuitListModel();
  int syncPage = 1;
  int syncPageSize = 10;

  void updateSyncSuitListModel(STSSuitListModel suitListModel) {
    this.syncSuitListModel = suitListModel;
    notifyListeners();
  }


  //模拟
  STSSuitListModel mockSuitListModel;
  int mockPage = 1;
  int mockPageSize = 10;

  void updateMockSuitListModel(STSSuitListModel suitListModel) {
    this.mockSuitListModel = suitListModel;
    notifyListeners();
  }

  void changeSyncPage(int syncPage) {
    this.syncPage = syncPage;
  }

  void changeSyncPageSize(int syncPageSize) {
    this.syncPageSize = syncPageSize;
  }

  void changeMockPage(int mockPage) {
    this.mockPage = mockPage;
  }

  void changeMockPageSize(int mockPageSize) {
    this.mockPageSize = mockPageSize;
  }

  void addMockSuitListModel(STSSuitListModel suitListModel) {
    if(this.mockSuitListModel == null){
      this.mockSuitListModel = suitListModel;
    }else{
      this.mockSuitListModel.rows.addAll(suitListModel.rows);
    }
    notifyListeners();
  }

  void addSyncSuitListModel(STSSuitListModel suitListModel) {
    if(this.syncSuitListModel == null){
      this.syncSuitListModel = suitListModel;
    }else {
      this.syncSuitListModel.rows.addAll(suitListModel.rows);
    }
    notifyListeners();
  }

}