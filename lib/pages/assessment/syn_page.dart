import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';

class SynPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("click to display"),
        onPressed: (){
          print(Provide.value<UserInfoProvider>(context).accessTokenModel.accessToken);
          print(Provide.value<UserInfoProvider>(context).userInfoModel.username);
        },
      ),
    );
  }
}
