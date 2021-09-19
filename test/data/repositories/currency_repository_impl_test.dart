import 'package:currency_charts/data/api/api_service.dart';
import 'package:currency_charts/data/models/currency_dto.dart';
import 'package:currency_charts/data/repositories/currency_repository_impl.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_repository_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  final tCurrencyDto = CurrencyDto('TEST', []);
  final tCurrency = Currency('TEST', []);

  test('should get and return currency data from API', () async {
    // arrange
    final mockApiService = MockApiService();
    final repository = CurrencyRepositoryImpl(apiService: mockApiService);
    when(mockApiService.getCurrencyData())
        .thenAnswer((_) async => tCurrencyDto);
    // act
    final result = await repository.getCurrenciesData();
    // assert
    verify(mockApiService.getCurrencyData());
    expect(result, tCurrency);
  });
}
