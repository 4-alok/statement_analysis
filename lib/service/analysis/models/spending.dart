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
