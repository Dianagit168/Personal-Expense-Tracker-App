import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/bar%20graph/bar_graph.dart';
import 'package:personal_expense_tracker_app/datas/expanse_datas.dart';
import 'package:personal_expense_tracker_app/datetime/date_time_helper.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  double calculateMax(
    ExpanseDatasProvider value,
    String sunDay,
    String monDay,
    String tueDay,
    String wedDay,
    String thurDay,
    String friDay,
    String satDay,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunDay] ?? 0,
      value.calculateDailyExpenseSummary()[monDay] ?? 0,
      value.calculateDailyExpenseSummary()[tueDay] ?? 0,
      value.calculateDailyExpenseSummary()[wedDay] ?? 0,
      value.calculateDailyExpenseSummary()[thurDay] ?? 0,
      value.calculateDailyExpenseSummary()[friDay] ?? 0,
      value.calculateDailyExpenseSummary()[satDay] ?? 0,
    ];
    values.sort();
    max = values.last + 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateWeekTotal(
    ExpanseDatasProvider value,
    String sunDay,
    String monDay,
    String tueDay,
    String wedDay,
    String thurDay,
    String friDay,
    String satDay,
  ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunDay] ?? 0,
      value.calculateDailyExpenseSummary()[monDay] ?? 0,
      value.calculateDailyExpenseSummary()[tueDay] ?? 0,
      value.calculateDailyExpenseSummary()[wedDay] ?? 0,
      value.calculateDailyExpenseSummary()[thurDay] ?? 0,
      value.calculateDailyExpenseSummary()[friDay] ?? 0,
      value.calculateDailyExpenseSummary()[satDay] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunDay = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monDay = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tueDay = convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wedDay = convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thurDay = convertDateTimeToString(
      startOfWeek.add(Duration(days: 4)),
    );
    String friDay = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String satDay = convertDateTimeToString(startOfWeek.add(Duration(days: 6)));

    //=================================

    return Consumer<ExpanseDatasProvider>(
      builder:
          (context, value, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Text(
                      'Week Total: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${calculateWeekTotal(value, sunDay, monDay, tueDay, wedDay, thurDay, friDay, satDay)}',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: BarGraph(
                  maxY: calculateMax(
                    value,
                    sunDay,
                    monDay,
                    tueDay,
                    wedDay,
                    thurDay,
                    friDay,
                    satDay,
                  ),
                  sunAmount: value.calculateDailyExpenseSummary()[sunDay] ?? 0,
                  monAmount: value.calculateDailyExpenseSummary()[monDay] ?? 0,
                  tueAmount: value.calculateDailyExpenseSummary()[tueDay] ?? 0,
                  wedAmount: value.calculateDailyExpenseSummary()[wedDay] ?? 0,
                  thurAmount:
                      value.calculateDailyExpenseSummary()[thurDay] ?? 0,
                  friAmount: value.calculateDailyExpenseSummary()[friDay] ?? 0,
                  satAmount: value.calculateDailyExpenseSummary()[satDay] ?? 0,
                ),
              ),
            ],
          ),
    );
  }
}
