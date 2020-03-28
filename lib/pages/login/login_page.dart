import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhishinetflutter/model/access_token_model.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/routers/application.dart';
import 'package:zhishinetflutter/service/service_method.dart';

class LoginPage extends StatelessWidget {

  GlobalKey<FormState> loginKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 750, height: 1334, );

    return Scaffold(
      body: Provide<UserInfoProvider>(builder: (context, child, val){

        String username = Provide.value<UserInfoProvider>(context).username;
        String password = Provide.value<UserInfoProvider>(context).password;

        return Container(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(90), left: ScreenUtil().setWidth(60), right: ScreenUtil().setWidth(60)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("欢迎登入视听说", style: TextStyle(
                  fontSize: ScreenUtil().setSp(50)
              ),),
              SizedBox(height: ScreenUtil().setHeight(50),),
              Column(
                children: <Widget>[
                  new Container(
                    child: new Form(
                      key: loginKey,
                      child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            keyboardType: TextInputType.text, //限制输入类型
                            decoration: new InputDecoration(labelText: "请输入用户名："),
                            onChanged: (v){
                              Provide.value<UserInfoProvider>(context).changeUsername(v);
                            },
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(labelText: "请输入密码："),
                            obscureText: true, //是否显示字符
                            autovalidate: false,  //是否自动验证
                            validator:(value){
                              return value.length<6 ? "密码长度不够6位":null;
                            } ,
                            onChanged: (v) {
                              Provide.value<UserInfoProvider>(context).changePassword(v);
                            },
                          ),
                          new Container(
                            child:   new SizedBox(
                              width:340 ,
                              height: 42,
                              child: new RaisedButton(
                                onPressed:() {
                                  _login(context, username, password);
                                },
                                child: new Text("登录"
                                  ,style: new TextStyle(
                                      fontSize: 18.0
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.lightBlueAccent)
                                ),
                                color: Colors.white,
                              ),
                            ) ,
                            margin: EdgeInsets.only(top: 50), //设置margin 距离顶部
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },)
    );
  }

  void _login(context, username, password) {
    var loginfrom = loginKey.currentState;
    if (loginfrom.validate()) {
      loginfrom.save();
      postRequest(context, 'access',
          formData: {
            "username": username,
            "password": password,
            "identity": "student"
      }).then((val) async{
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('accessToken', val.toString());
        AccessTokenModel accessToken = AccessTokenModel.fromJson(json.decode(val.toString()));
        Provide.value<UserInfoProvider>(context).updateAccessToken(accessToken);
        Application.router.navigateTo(context, '/index');
      });
    }
  }
}
