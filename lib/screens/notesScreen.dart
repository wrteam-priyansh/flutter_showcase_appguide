import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase_app/data/showCase/showCaseRepository.dart';
import 'package:showcase_app/utils/constants.dart';
import 'package:showcaseview/showcaseview.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();

  static Route<NotesScreen> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        //Passting the showcase widget
        builder: ((context) => ShowCaseWidget(
            onFinish: () {
              ShowcaseRepository.setAddNoteShowCase(false);
            },
            builder: Builder(builder: (context) => NotesScreen()))));
  }
}

class _NotesScreenState extends State<NotesScreen> {
  GlobalKey noteDismissiableShowcaseKey = GlobalKey();
  GlobalKey addNoteShowcaseKey = GlobalKey();

  //Need to take the context for note delete and edit gesture
  BuildContext? _showAddNoteEditDeleteDissmissShowCaseContext;

  @override
  void initState() {
    super.initState();
    //start the showcase guide
    Future.delayed(showCaseDisplayDelayInDuration, () {
      if (ShowcaseRepository.getAddNoteShowCase()) {
        ShowCaseWidget.of(context)!.startShowCase([
          addNoteShowcaseKey,
        ]);
      }
    });
  }

  List<String> notesTitle = [];

  Widget _buildNoteContainer(int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(notesTitle[index]),
      ),
    );
  }

  void addNote(String noteTitle) async {
    notesTitle.add(noteTitle);
    setState(() {});

    //Need to check if we need to show the guide for note deletion and edition
    if (ShowcaseRepository.getShowNoteEditAndDeleteDissmissShowCase()) {
      //giving the delay so we can access the context
      await Future.delayed(showCaseDisplayDelayInDuration);
      //if context is not empty then go furthure
      if (_showAddNoteEditDeleteDissmissShowCaseContext != null) {
        //display the note edit and delete dissmiss guide
        ShowCaseWidget.of(_showAddNoteEditDeleteDissmissShowCaseContext!)!
            .startShowCase([noteDismissiableShowcaseKey]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: ListView.builder(
          itemCount: notesTitle.length,
          itemBuilder: (context, index) {
            //Need to show note guide for first note

            return index == 0
                ?
                //if need to show the guide
                ShowcaseRepository.getShowNoteEditAndDeleteDissmissShowCase()
                    ? ShowCaseWidget(
                        onFinish: () {
                          ShowcaseRepository
                              .setShowNoteEditAndDeleteDissmissShowCase(false);
                        },
                        builder: Builder(builder: (context) {
                          _showAddNoteEditDeleteDissmissShowCaseContext =
                              context;
                          return Showcase(
                              key: noteDismissiableShowcaseKey,
                              child: _buildNoteContainer(index),
                              description:
                                  "Swipe left to edit and swipe right to delete the note");
                        }),
                      )
                    : _buildNoteContainer(index)
                : _buildNoteContainer(index);
          }),
      floatingActionButton: Showcase(
        description: "Add note",
        key: addNoteShowcaseKey,
        child: FloatingActionButton(
          onPressed: () {
            addNote("Notes title will go here");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
