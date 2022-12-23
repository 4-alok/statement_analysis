extension IsSameDate on DateTime {
  bool isSameDate(DateTime other) =>
      this.year == other.year &&
      this.month == other.month &&
      this.day == other.day;
}
