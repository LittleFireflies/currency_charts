import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';
import 'package:currency_charts/utils/failures.dart';
import 'package:dartz/dartz.dart';

class GetCurrenciesData {
  final CurrencyRepository repository;

  GetCurrenciesData({required this.repository});

  Future<Either<Failure, Currency>> execute() {
    return repository.getCurrenciesData();
  }
}
