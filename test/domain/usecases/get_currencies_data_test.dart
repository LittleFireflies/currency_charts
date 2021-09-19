import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
import 'package:currency_charts/utils/interval.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_currencies_data_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  final tCurrency = Currency('TEST', []);

  test('should get and return currency data from repository', () async {
    // arrange
    final mockRepository = MockCurrencyRepository();
    final usecase = GetCurrenciesData(repository: mockRepository);
    when(mockRepository.getCurrenciesData(interval: ChartsInterval.Week_1))
        .thenAnswer((_) async => Right(tCurrency));
    // act
    final result = await usecase.execute(ChartsInterval.Week_1);
    // assert
    verify(mockRepository.getCurrenciesData(interval: ChartsInterval.Week_1));
    expect(result, Right(tCurrency));
  });
}
