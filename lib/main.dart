import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/GlobalConst.dart';
import 'Controller/HomeController.dart';
import 'Controller/LoginController.dart';
import 'Pages/HomePage.dart';
import 'Pages/LoginPage.dart';

SharedPreferences prefs= SharedPreferences.getInstance() as SharedPreferences;
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  var isLogin = prefs.getBool("IsLogin");
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
            ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(context)),
          ],
          child:
          MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: mainColor,
              primarySwatch: generateMaterialColor(mainColor),
              primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white),
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                brightness: Brightness.dark
              ),
            ),
            home: (isLogin!=null&&isLogin)?HomePage(): LoginPage(),
          )
      )
  );
}