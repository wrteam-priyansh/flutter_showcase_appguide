import 'package:hive/hive.dart';
import 'package:showcase_app/utils/hiveBoxKeys.dart';

class ShowcaseRepository {
  static bool getShowHomeScreenShowCase() {
    return Hive.box(showCaseBoxKey).get(showHomeScreenGuideKey) ?? true;
  }

  static void setShowHomeScreenShowCase(bool value) {
    Hive.box(showCaseBoxKey).put(showHomeScreenGuideKey, value);
  }

  static bool getAddNoteShowCase() {
    return Hive.box(showCaseBoxKey).get(showAddNoteGuideKey) ?? true;
  }

  static void setAddNoteShowCase(bool value) {
    Hive.box(showCaseBoxKey).put(showAddNoteGuideKey, value);
  }

  static bool getShowNoteEditAndDeleteDissmissShowCase() {
    return Hive.box(showCaseBoxKey).get(showNoteEditDeleteGestureKey) ?? true;
  }

  static void setShowNoteEditAndDeleteDissmissShowCase(bool value) {
    Hive.box(showCaseBoxKey).put(showNoteEditDeleteGestureKey, value);
  }
}
