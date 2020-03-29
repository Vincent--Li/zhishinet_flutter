import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/pages/login/login_page.dart';
import 'package:zhishinetflutter/provider/current_index.dart';
import 'package:zhishinetflutter/provider/filter_option_provider.dart';
import 'package:zhishinetflutter/provider/mock_page_provider.dart';
import 'package:zhishinetflutter/provider/settings_provider.dart';
import 'package:zhishinetflutter/provider/syn_page_provider.dart';
import 'package:zhishinetflutter/provider/user_info_profider.dart';
import 'package:zhishinetflutter/routers/application.dart';
import 'package:zhishinetflutter/routers/routers.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';


void main(){
  //TODO: 定义notification
  var currentIndexProvider = CurrentIndexProvider();
  var filterOptionProvider = FilterOptionProvider();
  var userInfoProvider = UserInfoProvider();
  var synPageProvider = SynPageProvider();
  var mockPageProvider = MockPageProvider();
  var settingsProvider = SettingsProvider();

  var providers = Providers()
    ..provide(Provider<CurrentIndexProvider>.value(currentIndexProvider))
    ..provide(Provider<FilterOptionProvider>.value(filterOptionProvider))
    ..provide(Provider<UserInfoProvider>.value(userInfoProvider))
    ..provide(Provider<SynPageProvider>.value(synPageProvider))
    ..provide(Provider<MockPageProvider>.value(mockPageProvider))
    ..provide(Provider<SettingsProvider>.value(settingsProvider));

  runApp(ProviderNode(child: MyApp(), providers: providers,));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
        home: SafeArea(
//          child: IndexPage(),
          child: LoginPage(),
        ),
      ),

    );
  }
}
