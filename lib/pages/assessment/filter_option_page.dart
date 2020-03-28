import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/model/suit_list_model.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/provider/filter_option_provider.dart';
import 'package:zhishinetflutter/provider/syn_page_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/service/service_method.dart';

class FilterOptionPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Provide<FilterOptionProvider>(
      builder: (context, child, val){


        List<ClassList> classList =  Provide.value<UserInfoProvider>(context).userInfoModel.classList;
        int status = Provide.value<FilterOptionProvider>(context).status;

        return Container(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(25), right: ScreenUtil().setWidth(25) ),
          height: ScreenUtil().setHeight(1000),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _statusGroup(context, status),
                  SizedBox(height: ScreenUtil().setHeight(40),),
                  _sessiosGroup(context, classList),
                  SizedBox(height: ScreenUtil().setHeight(40),),
                  _datePicker(context),
                ],
              ),
              Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonTheme(
                      height: ScreenUtil().setHeight(60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('取消', style: TextStyle(fontSize: 20)),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.transparent)
                            ),
                            color: Colors.white,
                          ),
                          SizedBox(width: ScreenUtil().setWidth(80),),
                          RaisedButton(
                            onPressed: () {
                              //TODO: 点击确定, 更新列表
                              _getSTSList(context);
                            },
                            child: const Text('确定', style: TextStyle(fontSize: 20, color: Colors.white)),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Colors.lightBlueAccent)
                            ),
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _statusGroup(context, int status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("状态", style: TextStyle(
          color: Colors.black38
        ),),
        SizedBox(height: ScreenUtil().setHeight(15),),
        Row(
          children: <Widget>[
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: status == 0?Colors.lightBlueAccent:Colors.transparent)
              ),
              color: status == 0?Colors.white:Color(0x10000000),
              child: Text("全部",
                style: TextStyle(
                  color: status == -1?Colors.lightBlueAccent:Colors.black45
                ),
              ),
              onPressed: (){
                Provide.value<FilterOptionProvider>(context).changeStatus(0);
              },
            ),
            SizedBox(width: ScreenUtil().setWidth(10),),
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: status == 1?Colors.lightBlueAccent:Colors.transparent)
              ),
              color: status == 1?Colors.white:Color(0x10000000),
              child: Text("未完成",
                style: TextStyle(
                  color: status == 1?Colors.lightBlueAccent:Colors.black45
                ),
              ),
              onPressed: (){
                Provide.value<FilterOptionProvider>(context).changeStatus(1);
              },
            ),
            SizedBox(width: ScreenUtil().setWidth(10),),

            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: status == 3?Colors.lightBlueAccent:Colors.transparent)
              ),
              color: status == 3?Colors.white:Color(0x10000000),
              child: Text("已完成",
                style: TextStyle(
                  color: status == 3?Colors.lightBlueAccent:Colors.black45
                ),
              ),
              onPressed: (){
                Provide.value<FilterOptionProvider>(context).changeStatus(3);
              },
            ),
          ],
        )
      ],
    );
  }
  Widget _sessiosGroup(context, List<ClassList> classList) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text("班级", style: TextStyle(
              color: Colors.black38
          ),),
          ListView.builder(
            shrinkWrap: true,
              itemCount: classList.length,
              itemBuilder:(context, index){
                return  _classInkWell(context, classList, index);
              }),
        ],
      ),
    );
  }

  Widget _datePicker(context) {
    DateTime selectedStartDate = Provide.value<FilterOptionProvider>(context).selectedStartDate;
    DateTime selectedEndDate = Provide.value<FilterOptionProvider>(context).selectedEndDate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("日期", style: TextStyle(
            color: Colors.black38
        ),),
        Row(
          children: <Widget>[
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color:Colors.lightBlueAccent)
              ),
              color: Colors.white,
              child: Text('${selectedStartDate.year}年${selectedStartDate.month}月${selectedStartDate.day}日'),
              onPressed: (){
                _selectStartDate(context);
              },
            ),
            Text(' - '),
            RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color:Colors.lightBlueAccent)
              ),
              color: Colors.white,
              child: Text('${selectedEndDate.year}年${selectedEndDate.month}月${selectedEndDate.day}日'),
              onPressed: (){
                _selectEndDate(context);
              },
            )

          ],
        )
      ],
    );
  }

  Widget _classInkWell(context,  List<ClassList> classList, index){

    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;

    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: index == classIndex?Colors.lightBlueAccent:Colors.transparent)
      ),
      color: index == classIndex?Colors.white:Color(0x10000000),
      child: Text(classList[index].className,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: index == classIndex?Colors.lightBlueAccent:Colors.black45,
        ),
      ),
      onPressed: (){
        Provide.value<FilterOptionProvider>(context).changeClassIndex(index);
      },
    );
  }

  Future<Null> _selectStartDate(BuildContext context) async {
    var selectedStartDate = Provide.value<FilterOptionProvider>(context).selectedStartDate;
    var selectedEndDate = Provide.value<FilterOptionProvider>(context).selectedEndDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: Provide.value<FilterOptionProvider>(context).selectedStartDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate && picked.isBefore(selectedEndDate)){
      Provide.value<FilterOptionProvider>(context).changeSelectedStartDate(picked);
    }else{
      _showAlertDialog(context);
    }

  }
  Future<Null> _selectEndDate(BuildContext context) async {
    var selectedStartDate = Provide.value<FilterOptionProvider>(context).selectedStartDate;
    var selectedEndDate = Provide.value<FilterOptionProvider>(context).selectedEndDate;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: Provide.value<FilterOptionProvider>(context).selectedEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate && picked.isAfter(selectedStartDate)){
      Provide.value<FilterOptionProvider>(context).changeSelectedEndDate(picked);
    }else{
      _showAlertDialog(context);
    }

  }

  _showAlertDialog(context) {
    showDialog(
      // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('注意'),
          titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
          content: Text('请确认开始日期大于结束日期'),
          contentTextStyle: TextStyle(color: Colors.green), // 内容文字样式
          backgroundColor: CupertinoColors.white,
          elevation: 8.0, // 投影的阴影高度
          semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
          shape: Border.all(),
          actions: <Widget>[
            // 点击增加显示的值
            FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('确认')),
          ],
        ));
  }

  void _getSTSList(context) {
    int syncPage = Provide.value<SynPageProvider>(context).syncPage;
    int syncPageSize = Provide.value<SynPageProvider>(context).syncPageSize;


    DateTime startDate = Provide.value<FilterOptionProvider>(context).selectedStartDate;
    Provide.value<SynPageProvider>(context).changeSelectedStartDate(startDate);


    DateTime endDate = Provide.value<FilterOptionProvider>(context).selectedEndDate;
    Provide.value<SynPageProvider>(context).changeSelectedEndDate(endDate);

    int status = Provide.value<FilterOptionProvider>(context).status;
    Provide.value<SynPageProvider>(context).changeStatus(status);

    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;
    int classIndex = Provide.value<FilterOptionProvider>(context).classIndex;

    String paramUrl = '?assessmentType=1'
        '&sessionId=${userInfoModel.classList[classIndex].globalSessionId}'
        '&startDateBegin=${startDate.millisecondsSinceEpoch}'
        '&startDateEnd=${endDate.millisecondsSinceEpoch}'
        '&page=${syncPage}'
        '&pageSize=${syncPageSize}';
    if(status != 0){
      paramUrl = paramUrl + '&statusId=${status}';
    }

    print("_getSTSList paramUrl is ===================== ${paramUrl}");

    getRequest(context, 'suitList', paramUrl).then((val){
      STSSuitListModel suitListModel = STSSuitListModel.fromJson(json.decode(val.toString()));
      if(suitListModel.rows.length > 0){
        Provide.value<SynPageProvider>(context).updateSyncSuitListModel(suitListModel);
      }

      Navigator.pop(context);

    });
  }

}
