import 'package:bloc_test/bloc_test.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
import 'package:currency_charts/presentation/bloc/currency/currency_bloc.dart';
import 'package:currency_charts/utils/failures.dart';
import 'package:currency_charts/utils/interval.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_bloc_test.mocks.dart';

@GenerateMocks([GetCurrenciesData])
void main() {
  late MockGetCurrenciesData mockGetCurrenciesData;
  late CurrencyBloc currencyBloc;

  final tCurrency = Currency('TEST', []);

  setUp(() {
    mockGetCurrenciesData = MockGetCurrenciesData();
    currencyBloc = CurrencyBloc(getCurrenciesData: mockGetCurrenciesData);
  });

  test('initial state should be EmptyCurrency', () {
    expect(currencyBloc.state, EmptyCurrency());
  });

  blocTest<CurrencyBloc, CurrencyState>(
    'should emit [Loading, HasData] when Load event is added',
    build: () {
      when(mockGetCurrenciesData.execute(ChartsInterval.Week_1))
          .thenAnswer((_) async => Right(tCurrency));
      return currencyBloc;
    },
    act: (bloc) => bloc.add(LoadCurrencyData(ChartsInterval.Week_1)),
    expect: () => [LoadingCurrency(), CurrencyHasData(tCurrency)],
  );

  blocTest<CurrencyBloc, CurrencyState>(
    'should emit [Loading, Error] when Load event is added but returns failure',
    build: () {
      when(mockGetCurrenciesData.execute(ChartsInterval.Week_1))
          .thenAnswer((_) async => Left(ServerFailure('Error')));
      return currencyBloc;
    },
    act: (bloc) => bloc.add(LoadCurrencyData(ChartsInterval.Week_1)),
    expect: () => [LoadingCurrency(), CurrencyError('Error')],
  );
}
