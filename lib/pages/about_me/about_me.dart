import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zhishinetflutter/routers/application.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(200),
            padding: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(20),
                ScreenUtil().setWidth(10),
                ScreenUtil().setWidth(20),
                ScreenUtil().setWidth(10)),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(220),
                  padding: EdgeInsets.only(left: 30, right: 20),
                  child: ClipOval(
                    child: Image.network("https://resources.zhishinet.com/userdata/tenant/13/profile/19859_6f5a9ae0-189d-4e00-aa7b-407579d9703b.jpg"),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(490),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil().setHeight(20),),
                      Text(
                        "志远",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(38),
                            color: Colors.black54
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(15),),
                      Text(
                        "芝士网皇家学院2015级 QA class",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: Colors.black54
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(15),),
                      Text(
                        "您的会员将于 2100-01-01 到期",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(25),
                            color: Colors.black38
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: (){
                    _launchURL();
                  },
                  leading: Icon(Icons.message),
                  title: Text("在线客服"),
                  trailing: InkWell(
                    onTap: (){
                      _launchURL();
                    },
                    child: Icon(Icons.navigate_next),
                  ),
                ),
                Divider(height: 20, indent: 20,),
                ListTile(
                  onTap: (){
                    _launchPhone();
                  },
                  leading: Icon(Icons.call),
                  title: Text("电话客服                         400-855-6595"),
                  trailing: InkWell(
                    onTap: (){
                      _launchPhone();
                    },
                    child: Icon(Icons.navigate_next),
                  ),
                ),
                Divider(height: 20, indent: 20,),

                ListTile(
                  onTap: (){
                    Application.router.navigateTo(context, '/settings');
                  },
                  leading: Icon(Icons.settings),
                  title: Text("设置"),
                  trailing: InkWell(
                    onTap: (){
                      Application.router.navigateTo(context, '/settings');
                    },
                    child: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void _launchPhone() async {
    String url = 'tel:400-855-6595';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'url不能进行访问, 异常';
    }
  }

  void _launchURL() async {
    String url = 'https://admin.qidian.qq.com/template/blue/mp/menu/qr-code-jump.html?linkType=0&env=ol&kfuin=2852153574&fid=18&key=e140a006e6e768fcfaba98d82eec1292&cate=1&type=16&ftype=1&_type=wpa&qidian=true';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'url不能进行访问, 异常';
    }
  }
}
