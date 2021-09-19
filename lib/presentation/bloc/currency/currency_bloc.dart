import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
import 'package:currency_charts/utils/interval.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final GetCurrenciesData getCurrenciesData;

  CurrencyBloc({required this.getCurrenciesData}) : super(EmptyCurrency());

  @override
  Stream<CurrencyState> mapEventToState(
    CurrencyEvent event,
  ) async* {
    if (event is LoadCurrencyData) {
      yield LoadingCurrency();
      final data = await getCurrenciesData.execute(event.interval);
      yield* data.fold(
        (failure) async* {
          yield CurrencyError(failure.message);
        },
        (currency) async* {
          yield CurrencyHasData(currency);
        },
      );
    }
  }
}
