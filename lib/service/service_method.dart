import 'package:dio/dio.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/config/service_url.dart';
import 'dart:async';

import 'package:zhishinetflutter/model/access_token_model.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';


Future postRequest(context, configPath, {formData}) async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/json";
    dio.options.responseType = ResponseType.plain;

    if(servicePath[configPath].contains('/sec/')){
//      SharedPreferences prefs = await SharedPreferences.getInstance();
      AccessTokenModel accessTokenModel = Provide.value<UserInfoProvider>(context).accessTokenModel;
      dio.options.headers['Authorization'] = '${accessTokenModel.tokenType} ${accessTokenModel.accessToken}';
    }

    print("start POST =====${servicePath[configPath]}");

    if(formData == null){
      response = await dio.post(servicePath[configPath]);
    }else{
      response = await dio.post(servicePath[configPath], data: formData);
    }
    if(response.statusCode == 200){
      print("end post ===== ${response.data}");
      return response.data;
    }else{
      print("end post ===== failed");
      throw Exception("后端接口异常");
    }
  }catch(e){
    return print('ERROR: ===========>{$e}');
  }
}

Future getRequest(context, configPath, paramUrl) async{
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/json";
    dio.options.responseType = ResponseType.plain;

    if(servicePath[configPath].contains('/sec/')){
      AccessTokenModel accessTokenModel = Provide.value<UserInfoProvider>(context).accessTokenModel;
      dio.options.headers['Authorization'] = '${accessTokenModel.tokenType} ${accessTokenModel.accessToken}';
    }

    print("start GET =====${servicePath[configPath] + paramUrl}");
    response = await dio.get(servicePath[configPath] + paramUrl);

    if(response.statusCode == 200){
      print("end get ===== ${response.data}");
      return response.data;
    }else{
      print("end get ===== failed");

      throw Exception("后端接口异常");
    }
  }catch(e){
    return print('ERROR: ===========>{$e}');
  }
}