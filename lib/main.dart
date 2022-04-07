import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:showcase_app/app/routes.dart';
import 'package:showcase_app/utils/hiveBoxKeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //open showcaseBox
  //This box will store all the showCaseGuide related value
  await Hive.openBox(showCaseBoxKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
