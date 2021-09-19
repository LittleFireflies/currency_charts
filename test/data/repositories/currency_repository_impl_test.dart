import 'package:currency_charts/data/api/api_service.dart';
import 'package:currency_charts/data/models/currency_dto.dart';
import 'package:currency_charts/data/repositories/currency_repository_impl.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/utils/exception.dart';
import 'package:currency_charts/utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_repository_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService mockApiService;
  late CurrencyRepositoryImpl repository;

  final tCurrencyDto = CurrencyDto('TEST', []);
  final tCurrency = Currency('TEST', []);

  setUp(() {
    mockApiService = MockApiService();
    repository = CurrencyRepositoryImpl(apiService: mockApiService);
  });

  test(
    'should get and return currency data from API',
    () async {
      // arrange
      when(mockApiService.getCurrencyData())
          .thenAnswer((_) async => tCurrencyDto);
      // act
      final result = await repository.getCurrenciesData();
      // assert
      verify(mockApiService.getCurrencyData());
      expect(result, Right(tCurrency));
    },
  );

  test(
    'should return ServerFailure when get data from API throws server exception',
    () async {
      // arrange
      when(mockApiService.getCurrencyData())
          .thenThrow(ServerException('Not Found'));
      // act
      final result = await repository.getCurrenciesData();
      // assert
      expect(result, Left(ServerFailure('Not Found')));
    },
  );
}
