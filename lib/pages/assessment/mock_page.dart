import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/pages/assessment/space_header.dart';
import 'package:zhishinetflutter/provider/assessment_page_provider.dart';
import 'package:zhishinetflutter/provider/filter_option_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/service/service_method.dart';

class MockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    STSSuitListModel suitListModel = Provide.value<AssessmentPageProvider>(context).mockSuitListModel;

    return Provide<AssessmentPageProvider>(
      builder: (context, child, val){
        if(suitListModel.rows!=null && suitListModel.rows.length > 0) {
          return EasyRefresh.custom(
            header: SpaceHeader(),
            onRefresh: () async {
              await _getFirstList(context);
            },
            onLoad: () async {
              await _getNextList(context);
            },
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return _getSuitItem(context, suitListModel.rows, index);;
                  },
                  childCount: suitListModel.rows.length,
                ),
              ),
            ],
          );
        }else{
          return Center(
            child: Text('暂无数据'),
          );
        }

      },);
  }

  Widget _getSuitItem(BuildContext context, List<Rows> rows, int index) {
    return Container(
      child: ListTile(
        title: Text(rows[index].title),
        subtitle: Text('${rows[index].endDate}'),
        trailing: Text('${rows[index].statusId == 1?'未完成':'已完成'}'),
        onTap: (){
          print(rows[index].sessionUserTrackingId);
        },
      ),
    );
  }

  Future _getFirstList(context) async{
    Provide.value<AssessmentPageProvider>(context).changeMockPage(1);
    Provide.value<AssessmentPageProvider>(context).changeMockPageSize(10);
    DateTime startDate = Provide.value<AssessmentPageProvider>(context).selectedStartDate;
    DateTime endDate = Provide.value<AssessmentPageProvider>(context).selectedEndDate;
    int status = Provide.value<AssessmentPageProvider>(context).status;
    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;
    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;

    String paramUrl = '?assessmentType=2'
        '&sessionId=${userInfoModel.classList[classIndex].globalSessionId}'
        '&startDateBegin=${startDate.millisecondsSinceEpoch}'
        '&startDateEnd=${endDate.millisecondsSinceEpoch}'
        '&page=1'
        '&pageSize=10';
    if(status != 0){
      paramUrl = paramUrl + '&status=${status}';
    }

    getRequest(context, 'suitList', paramUrl).then((val){
      STSSuitListModel suitListModel = STSSuitListModel.fromJson(json.decode(val.toString()));
      Provide.value<AssessmentPageProvider>(context).updateMockSuitListModel(suitListModel);
      return suitListModel;
    });
  }

  Future _getNextList(context) async{
    int mockPage = Provide.value<AssessmentPageProvider>(context).mockPage;
    int mockPageSize = Provide.value<AssessmentPageProvider>(context).mockPageSize;
    DateTime startDate = Provide.value<AssessmentPageProvider>(context).selectedStartDate;
    DateTime endDate = Provide.value<AssessmentPageProvider>(context).selectedEndDate;
    int status = Provide.value<AssessmentPageProvider>(context).status;
    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;

    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;

    String paramUrl = '?assessmentType=2'
        '&sessionId=${userInfoModel.classList[classIndex].globalSessionId}'
        '&startDateBegin=${startDate.millisecondsSinceEpoch}'
        '&startDateEnd=${endDate.millisecondsSinceEpoch}'
        '&page=${mockPage}'
        '&pageSize=${mockPageSize}';
    if(status != 0){
      paramUrl = paramUrl + '&status=${status}';
    }

    getRequest(context, 'suitList', paramUrl).then((val){
      STSSuitListModel suitListModel = STSSuitListModel.fromJson(json.decode(val.toString()));
      Provide.value<AssessmentPageProvider>(context).changeMockPage(mockPage + 1);
      Provide.value<AssessmentPageProvider>(context).addMockSuitListModel(suitListModel);
      return suitListModel;
    });
  }
}
