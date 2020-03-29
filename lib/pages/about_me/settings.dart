import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';
import 'package:zhishinetflutter/provider/settings_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/provider/current_index.dart';
import 'package:zhishinetflutter/routers/application.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserInfoModel userInfoModel = Provide.value<UserInfoProvider>(context).userInfoModel;
    loadCache(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.black45,),
          onPressed: (){
            Application.router.pop(context);
          },
        ),
        title: Text("设置", style: TextStyle(
          color: Colors.black45
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0x07000000),
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child:  Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text("姓名", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Text(userInfoModel.fullName, style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                      ),
                      Divider(color: Color(0x07000000), thickness: 2, ),
                      ListTile(
                        leading: Text("用户名", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Text(userInfoModel.username, style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                      ),
                      Divider(color: Color(0x07000000), thickness: 2, ),
                      ListTile(
                          leading: Text("班级", style: TextStyle(
                              fontSize: ScreenUtil().setSp(32)
                          ),),
                          trailing: Container(
                            width: ScreenUtil().setWidth(290),
                            child: Row(
                              children: <Widget>[
                                Text("2015级 QA class",style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32)
                                ), ),
                                InkWell(
                                  onTap: (){
                                    Application.router.navigateTo(context, '/sessionSettings');
                                  },
                                  child: Icon(Icons.navigate_next),
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Divider(thickness: 5, color: Color(0x00000000),),
                Container(
                  color: Colors.white,
                  child:  Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text("修改手机号", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Container(
                          width: ScreenUtil().setWidth(250),
                          child: Row(
                            children: <Widget>[
                              Text(userInfoModel.cellNumber, style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32)
                              ),),
                              InkWell(
                                onTap: (){
                                  //TODO: 修改手机号流程
                                },
                                child: Icon(Icons.navigate_next),
                              ),
                            ],
                          ),
                        ),
                        onTap: (){
                          //TODO: 修改手机号
                        },

                      ),
                      Divider(color: Color(0x07000000), thickness: 2, ),
                      ListTile(
                        leading: Text("修改密码", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: InkWell(
                          onTap: (){
                            //TODO: 修改密码流程
                          },
                          child: Icon(Icons.navigate_next),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 5, color: Color(0x00000000), ),
                Container(
                  color: Colors.white,
                  child:  Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text("清除缓存", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Container(
                          width: ScreenUtil().setWidth(140),
                          child: Provide<SettingsProvider>(
                            builder: (context, child, val){
                              String cacheSizeStr = Provide.value<SettingsProvider>(context).cacheSizeStr;
                              return Row(
                                children: <Widget>[
                                  Text(cacheSizeStr, style: TextStyle(
                                      fontSize: ScreenUtil().setSp(32)
                                  ),),
                                  InkWell(
                                    onTap: (){
                                      //清除缓存
                                      _showAlertDialog(context);
                                    },
                                    child: Icon(Icons.navigate_next),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Divider(color: Color(0x07000000), thickness: 2, ),
                      ListTile(
                        leading: Text("关于我们", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Container(
                          width: ScreenUtil().setWidth(140),
                          child: Row(
                            children: <Widget>[
                              Text("v1.0.0", style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32)
                              ),),
                              InkWell(
                                onTap: (){
                                  //TODO: 关于我们
                                },
                                child: Icon(Icons.navigate_next),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(750),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: ScreenUtil().setWidth(750),
                height: ScreenUtil().setWidth(120),
                child: RaisedButton(
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.remove('accessToken');
                    Provide.value<UserInfoProvider>(context).clearAll();
                    Provide.value<CurrentIndexProvider>(context).clearAll();
                    Application.router.navigateTo(context, '/login');
                  },
                  child: const Text('退出登录', style: TextStyle(fontSize: 20)),
                  color: Colors.white,
                  textColor: Colors.redAccent,
                  elevation: 0,
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  _showAlertDialog(context) {
    showDialog(
      // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('注意'),
          titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
          content: Text('确认清除缓存?'),
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
                child: Text('取消')
            ),
            FlatButton(
                onPressed: (){
                  //TODO: 清除缓存
                  Navigator.pop(context);
                },
                child: Text('确认')
            ),
          ],
        ));
  }

  void _clearCache(context) async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache(context);
    Fluttertoast.showToast(msg: '清除缓存成功');
  }
  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }

  _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()
      ..add('B')
      ..add('K')
      ..add('M')
      ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  ///加载缓存
  Future<Null> loadCache(context) async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
    print('临时目录大小: ' + value.toString());
    Provide.value<SettingsProvider>(context).changeCacheSizeStr(_renderSize(value));
  }

}
