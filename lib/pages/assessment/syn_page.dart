import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/pages/assessment/space_header.dart';
import 'package:zhishinetflutter/provider/assessment_page_provider.dart';
import 'package:zhishinetflutter/provider/filter_option_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/service/service_method.dart';
import 'package:duration/duration.dart';


class SynPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    STSSuitListModel suitListModel = Provide.value<AssessmentPageProvider>(context).syncSuitListModel;
    
    return Provide<AssessmentPageProvider>(
      builder: (context, child, val){
        if(suitListModel.rows!=null && suitListModel.rows.length > 0) {
          return EasyRefresh.custom(
            header: SpaceHeader(),
            onRefresh: () async {
              await _getFistList(context);
            },
            onLoad: () async {
              await _getNextPage(context);
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



  Future _getFistList(context) async{
    Provide.value<AssessmentPageProvider>(context).changeSyncPage(1);
    Provide.value<AssessmentPageProvider>(context).changeSyncPageSize(10);
    DateTime startDate = Provide.value<AssessmentPageProvider>(context).selectedStartDate;
    DateTime endDate = Provide.value<AssessmentPageProvider>(context).selectedEndDate;
    int status = Provide.value<AssessmentPageProvider>(context).status;
    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;
    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;


    String paramUrl = '?assessmentType=1'
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
      Provide.value<AssessmentPageProvider>(context).updateSyncSuitListModel(suitListModel);
      return suitListModel;
    });
  }

  Future _getNextPage(context) async{
    int syncPage = Provide.value<AssessmentPageProvider>(context).syncPage;
    int syncPageSize = Provide.value<AssessmentPageProvider>(context).syncPageSize;
    DateTime startDate = Provide.value<AssessmentPageProvider>(context).selectedStartDate;
    DateTime endDate = Provide.value<AssessmentPageProvider>(context).selectedEndDate;
    int status = Provide.value<AssessmentPageProvider>(context).status;
    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;
    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;


    String paramUrl = '?assessmentType=1'
        '&sessionId=${userInfoModel.classList[classIndex].globalSessionId}'
        '&startDateBegin=${startDate.millisecondsSinceEpoch}'
        '&startDateEnd=${endDate.millisecondsSinceEpoch}'
        '&page=${syncPage+1}'
        '&pageSize=${syncPageSize}';
    if(status != 0){
      paramUrl = paramUrl + '&status=${status}';
    }

    getRequest(context, 'suitList', paramUrl).then((val){
      STSSuitListModel suitListModel = STSSuitListModel.fromJson(json.decode(val.toString()));
      Provide.value<AssessmentPageProvider>(context).changeSyncPage(syncPage+1);
      Provide.value<AssessmentPageProvider>(context).addSyncSuitListModel(suitListModel);
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
