class PerDaySpending {
  final DateTime date;
  final double amount;

  const PerDaySpending(this.date, this.amount);

  PerDaySpending copyWith({DateTime? date, double? amount}) =>
      PerDaySpending(date ?? this.date, amount ?? this.amount);

  @override
  String toString() => 'PerDaySpending(date: $date, amount: $amount)';

  @override
  bool operator ==(covariant PerDaySpending other) => identical(this, other)
      ? true
      : other.date == date && other.amount == amount;

  @override
  int get hashCode => date.hashCode ^ amount.hashCode;
}

class WeeklySpending {
  final int weekOfYear;
  final double totalAmount;
  final DateTime firstDayOfWeek;
  const WeeklySpending({
    required this.weekOfYear,
    required this.totalAmount,
    required this.firstDayOfWeek,
  });

  WeeklySpending copyWith({
    int? weekOfYear,
    double? totalAmount,
    DateTime? firstDayOfWeek,
  }) {
    return WeeklySpending(
      weekOfYear: weekOfYear ?? this.weekOfYear,
      totalAmount: totalAmount ?? this.totalAmount,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
    );
  }

  @override
  String toString() =>
      'WeeklySpending(weekOfYear: $weekOfYear, totalAmount: $totalAmount, firstDayOfWeek: $firstDayOfWeek)';

  @override
  bool operator ==(covariant WeeklySpending other) {
    if (identical(this, other)) return true;

    return other.weekOfYear == weekOfYear &&
        other.totalAmount == totalAmount &&
        other.firstDayOfWeek == firstDayOfWeek;
  }

  @override
  int get hashCode =>
      weekOfYear.hashCode ^ totalAmount.hashCode ^ firstDayOfWeek.hashCode;
}
