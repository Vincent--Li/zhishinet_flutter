import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhishinetflutter/pages/assessment/filter_option_page.dart';
import 'package:zhishinetflutter/pages/assessment/syn_page.dart';

import 'mock_page.dart';

class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
                  child: TabBar(
                    indicatorColor: Colors.lightBlueAccent,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black45,
                    unselectedLabelColor: Colors.black26,
                    tabs: [
                      Tab(
                        child: Text(
                          "同步",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "模拟",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
          actions: <Widget>[
            Builder(
              builder: (context){
                return IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.black26,
                  onPressed: (){
                    print('test');
                    Scaffold.of(context).openEndDrawer();
                  },
                );
              },
            )
          ],
          centerTitle: true,
        ),
        endDrawer: Drawer(
          child: Center(
            child: FilterOptionPage(),
          ),
        ),
        body: TabBarView(
          children: [
            SynPage(),
            MockPage(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}





