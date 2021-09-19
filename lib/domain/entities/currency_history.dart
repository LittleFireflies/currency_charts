import 'package:equatable/equatable.dart';

class CurrencyHistory extends Equatable {
  final DateTime date;
  final double value;

  CurrencyHistory(this.date, this.value);

  @override
  List<Object?> get props => [date, value];
}
