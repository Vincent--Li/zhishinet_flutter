import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/pages/about_me/about_me.dart';
import 'package:zhishinetflutter/pages/assessment/assessment_page.dart';
import 'package:zhishinetflutter/provider/current_index.dart';


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
    ScreenUtil.init(context, width: 750, height: 1334, );

    return Provide<CurrentIndexProvide>(
      builder: (context, chilid, val){
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
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
                Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
