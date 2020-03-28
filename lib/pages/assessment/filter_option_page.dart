import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterOptionPage extends StatelessWidget {

  List<String> classNames = ['2015级QA Aclass', '2015级QA Aclass','2015级QA Aclass'];

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO: 列表筛选项
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      height: ScreenUtil().setHeight(1000),
      child: Column(
        children: <Widget>[
          _statusGroup(),
          SizedBox(height: ScreenUtil().setHeight(40),),
          _sessiosGroup(),
          SizedBox(height: ScreenUtil().setHeight(40),),
          _datePicker()
        ],
      ),
    );
  }

  Widget _statusGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("状态"),
        Row(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Text("test")
              ],
            )
          ],
        )
      ],
    );
  }
  Widget _sessiosGroup() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text("班级"),
          ListView.builder(
            shrinkWrap: true,
              itemCount: classNames.length,
              itemBuilder:(context, index){
                return  _classInkWell(classNames[index]);
              }),
        ],
      ),
    );
  }

  Widget _datePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("日期"),
        Row(
          children: <Widget>[
            Text("test"),
            Text("test"),

          ],
        )
      ],
    );
  }

  Widget _classInkWell(String className){
    return InkWell(
      child: Text(className),
      onTap: (){

      },
    );
  }
}
