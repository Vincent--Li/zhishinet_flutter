import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/pages/about_me/about_me.dart';
import 'package:zhishinetflutter/pages/assessment/assessment_page.dart';
import 'package:zhishinetflutter/provider/current_index.dart';
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

    _getUserInfo(context);

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
  }

  void _getUserInfo(context) {
    getRequest(context, 'users', "" ).then((val){
      UserInfoModel userInfoModel = UserInfoModel.fromJson(json.decode(val.toString()));
      Provide.value<UserInfoProvider>(context).updateUserInfo(userInfoModel);
    });
  }
}
