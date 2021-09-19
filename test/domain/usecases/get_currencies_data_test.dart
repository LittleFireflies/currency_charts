import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/domain/usecases/get_currencies_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_currencies_data_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  test('should get currency data from repository', () {
    // arrange
    final mockRepository = MockCurrencyRepository();
    final usecase = GetCurrenciesData(repository: mockRepository);
    // act
    usecase.execute();
    // assert
    verify(mockRepository.getCurrenciesData());
  });
}
