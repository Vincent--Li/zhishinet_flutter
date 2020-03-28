import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhishinetflutter/routers/application.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        trailing: Text("志远", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                      ),
                      Divider(color: Color(0x07000000), thickness: 2, ),
                      ListTile(
                        leading: Text("用户名", style: TextStyle(
                            fontSize: ScreenUtil().setSp(32)
                        ),),
                        trailing: Text("LIZHIYUAN", style: TextStyle(
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
                              Text("18146615515", style: TextStyle(
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
                          child: Row(
                            children: <Widget>[
                              Text("23.5M", style: TextStyle(
                                  fontSize: ScreenUtil().setSp(32)
                              ),),
                              InkWell(
                                onTap: (){
                                  //TODO: 清除缓存
                                },
                                child: Icon(Icons.navigate_next),
                              )
                            ],
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
                  onPressed: () {

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
}
