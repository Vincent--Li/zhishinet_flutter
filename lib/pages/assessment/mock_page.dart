import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';
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


  Widget _getSuitItem(BuildContext context, List<Rows> rows, int index) {
    return Container(
      child: Card(
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(20), ScreenUtil().setWidth(30), ScreenUtil().setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text(rows[index].title,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(35)
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('${(rows[index].statusId == 1 || rows[index].statusId == 2 )?'未完成':'已完成'}',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                          color: Colors.black45
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(20),),
              _getLeftTime(rows[index])
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLeftTime(Rows row) {
    return Row(
      children: <Widget>[
        Icon(Icons.access_time, color: Colors.black26,),
        Text(_calculateTimeDifference(row.endDate), style: TextStyle(color: Colors.black26,),)
      ],
    );
  }

  String _calculateTimeDifference(int endDate) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(endDate * 1000);
    print(dateTime.year);
    print(dateTime.month);
    print(dateTime.day);
    DateTime now = DateTime.now();
    print(now.year);
    print(now.month);
    print(now.day);
    Duration duration = dateTime.difference(now);
    return prettyDuration(duration);
  }
}
