import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/utils/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, Currency>> getCurrenciesData();
}
