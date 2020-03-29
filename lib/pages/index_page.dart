import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/pages/about_me/about_me.dart';
import 'package:zhishinetflutter/pages/assessment/assessment_page.dart';
import 'package:zhishinetflutter/provider/current_index.dart';
import 'package:zhishinetflutter/provider/filter_option_provider.dart';
import 'package:zhishinetflutter/provider/assessment_page_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/service/service_method.dart';


class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book),
        title: Text('作业')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('我的')
    )

  ];

  final List<Widget> tabBodies = [
    AssessmentPage(),
    AboutMePage()
  ];

  @override
  Widget build(BuildContext context) {
    //TODO: 自动登录
    return FutureBuilder(
      future: Future.wait([
        _getSynList(context),
        _getMockList(context)
      ]),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Provide<CurrentIndexProvider>(
            builder: (context, child, val){
              int currentIndex = Provide.value<CurrentIndexProvider>(context).currentIndex;
              return Scaffold(
                body: IndexedStack(
                  index: currentIndex,
                  children: tabBodies,
                ),
                backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
                bottomNavigationBar: Container(
                  height: ScreenUtil().setHeight(110),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: bottomTabs,
                    currentIndex: currentIndex,
                    onTap: (index){
                      Provide.value<CurrentIndexProvider>(context).changeIndex(index);
                    },
                  ),
                ),
              );
            },
          );
        }else{
          return Text("加载中");
        }
      },
    );
  }

  Future _getSynList(context) async{
    int syncPage = Provide.value<AssessmentPageProvider>(context).syncPage;
    int syncPageSize = Provide.value<AssessmentPageProvider>(context).syncPageSize;
    DateTime startDate = Provide.value<AssessmentPageProvider>(context).selectedStartDate;
    DateTime endDate = Provide.value<AssessmentPageProvider>(context).selectedEndDate;
    int status = Provide.value<AssessmentPageProvider>(context).status;
    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;

    String paramUrl = '?assessmentType=1'
        '&sessionId=${userInfoModel.classList[2].globalSessionId}'
        '&startDateBegin=${startDate.millisecondsSinceEpoch}'
        '&startDateEnd=${endDate.millisecondsSinceEpoch}'
        '&page=${syncPage}'
        '&pageSize=${syncPageSize}';
    if(status != 0){
      paramUrl = paramUrl + '&status=${status}';
    }

    getRequest(context, 'suitList', paramUrl).then((val){
      STSSuitListModel suitListModel = STSSuitListModel.fromJson(json.decode(val.toString()));
      Provide.value<AssessmentPageProvider>(context).updateSyncSuitListModel(suitListModel);
      return suitListModel;
    });
  }

  Future _getMockList(context) async{
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
      Provide.value<AssessmentPageProvider>(context).updateMockSuitListModel(suitListModel);

      return suitListModel;
    });
  }
}
