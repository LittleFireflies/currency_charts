import 'package:currency_charts/domain/entities/currency.dart';
import 'package:currency_charts/domain/repositories/currency_repository.dart';

class GetCurrenciesData {
  final CurrencyRepository repository;

  GetCurrenciesData({required this.repository});

  Future<Currency> execute() {
    return repository.getCurrenciesData();
  }
}
