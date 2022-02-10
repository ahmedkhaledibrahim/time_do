import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:time_do/db/db_helper.dart';
import 'package:time_do/services/notification_services.dart';
import 'package:time_do/services/theme_services.dart';
import 'package:time_do/ui/screens/add_task_screen.dart';
import 'package:time_do/ui/screens/home_screen.dart';
import 'package:time_do/ui/screens/notification_screen.dart';
import 'package:get/get.dart';
import 'package:time_do/ui/size_config.dart';
import 'package:time_do/ui/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper().database;
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeServices _ts = ThemeServices();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: _ts.theme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

