import 'package:currency_charts/data/models/currency_dto.dart';

abstract class ApiService {
  Future<CurrencyDto> getCurrencyData();
}
