part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object?> get props => [];
}

class EmptyCurrency extends CurrencyState {}

class LoadingCurrency extends CurrencyState {}

class CurrencyHasData extends CurrencyState {
  final Currency currency;

  CurrencyHasData(this.currency);

  @override
  List<Object?> get props => [currency];
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError(this.message);

  @override
  List<Object?> get props => [message];
}
