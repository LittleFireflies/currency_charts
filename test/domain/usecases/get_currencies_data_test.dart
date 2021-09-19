import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
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
    when(mockRepository.getCurrenciesData()).thenAnswer((_) async => tCurrency);
    // act
    final result = await usecase.execute();
    // assert
    verify(mockRepository.getCurrenciesData());
    expect(result, tCurrency);
  });
}
