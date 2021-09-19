import 'package:currency_charts/domain/entities/currency.dart';

abstract class CurrencyRepository {
  Future<Currency> getCurrenciesData();
}
