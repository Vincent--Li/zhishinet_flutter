import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  static String root = '/';
  static String login = '/login';
  static String assessment = '/assessment';
  static String about_me = '/about_me';
  static String settings = '/settings';
  static String sessionSettings = '/sessionSettings';
  static String index = '/index';


  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> params){
        print('ERROR===>ROUTE WAS NOT FOUND');
      }
    );
    router.define(assessment, handler: assessmentHandler);
    router.define(about_me, handler: aboutMeHandler );
    router.define(settings, handler: settingsHandler );
    router.define(sessionSettings, handler: sessionSettingsHandler );
    router.define(index, handler: indexHandler );
    router.define(login, handler: loginHandler );
  }
}


