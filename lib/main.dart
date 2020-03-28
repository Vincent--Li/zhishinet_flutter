import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:zhishinetflutter/pages/index_page.dart';
import 'package:zhishinetflutter/provider/current_index.dart';
import 'package:zhishinetflutter/routers/application.dart';
import 'package:zhishinetflutter/routers/routers.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';


void main(){
  //TODO: 定义notification
  var currentIndexProvider = CurrentIndexProvide();

  //TODO: 添加provide监听
  var providers = Providers()
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvider));
  //providers..provide(Provider<Counter>.value(counter));

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
          child: IndexPage(),
        ),
      ),

    );
  }
}
