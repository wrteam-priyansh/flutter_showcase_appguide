import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase_app/app/routes.dart';
import 'package:showcase_app/data/showCase/showCaseRepository.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeScreen extends StatefulWidget {
  static Route<HomeScreen> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        //Declaring the showcaseWidget
        builder: ((context) => ShowCaseWidget(
            onFinish: () {
              //
              ShowcaseRepository.setShowHomeScreenShowCase(false);
            },
            builder: Builder(builder: (context) => HomeScreen()))));
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey calendarButtonShowCaseKey = GlobalKey();

  final GlobalKey addAttendanceFloatingActionButtonShowCaseKey = GlobalKey();

  @override
  void initState() {
    //starting the showcase guide
    Future.delayed(showCaseDisplayDelayInDuration, () {
      if (ShowcaseRepository.getShowHomeScreenShowCase()) {
        ShowCaseWidget.of(context)!.startShowCase([
          calendarButtonShowCaseKey,
          addAttendanceFloatingActionButtonShowCaseKey
        ]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  //
                  Navigator.of(context).pushNamed(Routes.notes);
                },
                icon: Icon(Icons.note))
          ],
          title: Text("Show case app"),
        ),
        floatingActionButton: Showcase(
            key: addAttendanceFloatingActionButtonShowCaseKey,
            description: "Tap to take attendance",
            child:
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {})),
        body: Center(
          child: IconButton(
              onPressed: () {},
              icon: Showcase(
                  description: "Tap to view monthly attendance",
                  key: calendarButtonShowCaseKey,
                  child: Icon(Icons.calendar_month))),
        ));
  }
}
