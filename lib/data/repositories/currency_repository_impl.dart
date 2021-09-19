import 'package:currency_charts/data/api/api_service.dart';
import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/utils/exception.dart';
import 'package:currency_charts/utils/failures.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final ApiService apiService;

  CurrencyRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, Currency>> getCurrenciesData() async {
    try {
      final data = await apiService.getCurrencyData();
      return Right(data.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
