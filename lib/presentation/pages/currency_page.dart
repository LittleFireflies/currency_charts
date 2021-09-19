import 'package:currency_charts/domain/entities/currency_history.dart';
import 'package:currency_charts/presentation/bloc/currency/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  void initState() {
    super.initState();
    context.read<CurrencyBloc>().add(LoadCurrencyData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BTC/USD'),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is LoadingCurrency) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CurrencyHasData) {
            final data = state.currency.histories;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1 BTC = \$${data[0].value}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: [
                      LineSeries<CurrencyHistory, DateTime>(
                          dataSource: data,
                          xValueMapper: (CurrencyHistory history, _) =>
                              history.date,
                          yValueMapper: (CurrencyHistory history, _) =>
                              history.value)
                    ],
                  ),
                ],
              ),
            );
          } else if (state is CurrencyError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
