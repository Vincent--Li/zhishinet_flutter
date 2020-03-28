import 'package:flutter/material.dart';
import 'package:zhishinetflutter/model/access_token_model.dart';
import 'package:zhishinetflutter/model/user_info_model.dart';

class UserInfoProvider with ChangeNotifier {
  String username = "";
  String password = "";
  AccessTokenModel accessTokenModel;
  UserInfoModel userInfoModel;

  changeUsername(username){
    this.username = username;
    notifyListeners();
  }

  changePassword(password){
    this.password = password;
    notifyListeners();
  }

  void updateAccessToken(AccessTokenModel accessToken) {
    this.accessTokenModel = accessToken;
  }

  void clearAll() {
    this.username = "";
    this.password = "";
    this.accessTokenModel = null;
  }

  void updateUserInfo(UserInfoModel userInfoModel) {
    this.userInfoModel= userInfoModel;
  }
}