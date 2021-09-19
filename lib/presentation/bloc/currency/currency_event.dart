part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object?> get props => [];
}

class LoadCurrencyData extends CurrencyEvent {
  final ChartsInterval interval;

  LoadCurrencyData(this.interval);

  @override
  List<Object?> get props => [interval];
}
