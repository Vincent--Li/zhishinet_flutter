import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:zhishinetflutter/pages/about_me/about_me.dart';
import 'package:zhishinetflutter/pages/about_me/session_settings.dart';
import 'package:zhishinetflutter/pages/about_me/settings.dart';
import 'package:zhishinetflutter/pages/assessment/assessment_page.dart';

Handler assessmentHandler = Handler(
  handlerFunc: (BuildContext context , Map<String, List<String>> params){
    return AssessmentPage();
  }
);

Handler aboutMeHandler = Handler(
    handlerFunc: (BuildContext context , Map<String, List<String>> params){
      return AboutMePage();
    }
);

Handler settingsHandler = Handler(
    handlerFunc: (BuildContext context , Map<String, List<String>> params){
      return SettingsPage();
    }
);

Handler sessionSettingsHandler = Handler(
    handlerFunc: (BuildContext context , Map<String, List<String>> params){
      return SessionSettingsPage();
    }
);