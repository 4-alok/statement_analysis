extension IsSameDate on DateTime {
  bool isSameDate(DateTime other) =>
      this.year == other.year &&
      this.month == other.month &&
      this.day == other.day;
}

// us same week
extension IsSameWeek on DateTime {
  bool isSameWeek(DateTime other) {
    final thisWeek = this.weekOfYear;
    final otherWeek = other.weekOfYear;
    return thisWeek == otherWeek;
  }

  // int get weekOfYear {
  //   final firstDay = DateTime(this.year, 1, 1);
  //   final firstWeekDay = firstDay.weekday;
  //   final firstWeekDays = 8 - firstWeekDay;
  //   final days = this.difference(firstDay).inDays;
  //   return ((days - firstWeekDays) / 7).floor() + 1;
  // }

  int get weekOfYear {
    final woy = ((ordinalDate - weekday + 10) ~/ 7);
    if (woy == 0) {
      return DateTime(year - 1, 12, 28).weekOfYear;
    }
    if (woy == 53 &&
        DateTime(year, 1, 1).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }
    return woy;
  }

  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  bool get isLeapYear => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}

extension FirstDayOfWeek on int {
  DateTime get firstDayOfWeek {
    final firstDay = DateTime.now().subtract(Duration(days: 7 * this));
    return DateTime(firstDay.year, firstDay.month, firstDay.day);
  }
}
