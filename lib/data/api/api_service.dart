import 'dart:math';

import 'package:currency_charts/data/models/currency_dto.dart';
import 'package:currency_charts/domain/entities/currency_history.dart';

abstract class ApiService {
  Future<CurrencyDto> getCurrencyData();
}

class ApiRandomService implements ApiService {
  static const double _currentValues = 47884.20;
  final double maxUpsDownsPercentage = 10 / 100;

  @override
  Future<CurrencyDto> getCurrencyData() {
    return Future.delayed(Duration(milliseconds: 1500), () {
      return CurrencyDto('BTC', _getRandomizedData());
    });
  }

  List<CurrencyHistory> _getRandomizedData() {
    final currenciesHistories = <CurrencyHistory>[
      CurrencyHistory(DateTime.now(), _currentValues),
    ];
    final randomizer = Random();

    for (var i = 0; i < 10; i++) {
      final currentValue = currenciesHistories[i];
      final maxUpsDowns = maxUpsDownsPercentage * currentValue.value;
      final maxValue = currentValue.value + maxUpsDowns;
      final minValue = currentValue.value - maxUpsDowns;
      final newValue = _doubleInRange(randomizer, minValue, maxValue);

      currenciesHistories.add(CurrencyHistory(
          DateTime.now().subtract(Duration(days: i + 1)), newValue));
    }

    return currenciesHistories;
  }

  double _doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
}
