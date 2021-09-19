import 'package:currency_charts/domain/entities/currency_history.dart';
import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  String name;
  List<CurrencyHistory> histories;

  Currency(this.name, this.histories);

  @override
  List<Object?> get props => [name, histories];
}
