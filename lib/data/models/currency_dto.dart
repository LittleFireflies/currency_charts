import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/entities/currency_history.dart';
import 'package:equatable/equatable.dart';

class CurrencyDto extends Equatable {
  final String name;
  final List<CurrencyHistory> histories;

  CurrencyDto(this.name, this.histories);

  Currency toEntity() => Currency(name, histories);

  @override
  List<Object?> get props => [name, histories];
}
