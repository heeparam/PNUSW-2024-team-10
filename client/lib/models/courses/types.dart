import 'package:heron/theme/label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum HeronCourseStatusType {
  now(HeronLabelColorType.red),
  liked(HeronLabelColorType.blue),
  done(HeronLabelColorType.gray);

  const HeronCourseStatusType(this.color);
  final HeronLabelColorType color;

  String getDisplayText(AppLocalizations l10n) {
    switch (this) {
      case HeronCourseStatusType.now:
        return l10n.coursesStatusNow;
      case HeronCourseStatusType.liked:
        return l10n.coursesStatusLiked;
      case HeronCourseStatusType.done:
        return l10n.coursesStatusDone;
    }
  }
}

enum HeronCourseDurationType {
  oneDay,
  overNight;

  String getDisplayText(AppLocalizations l10n) {
    switch (this) {
      case HeronCourseDurationType.oneDay:
        return l10n.coursesDurationOneDay;
      case HeronCourseDurationType.overNight:
        return l10n.coursesDurationOverNight;
    }
  }
}