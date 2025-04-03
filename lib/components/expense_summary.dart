import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/bar%20graph/bar_graph.dart';
import 'package:personal_expense_tracker_app/datas/expanse_datas.dart';
import 'package:personal_expense_tracker_app/datetime/date_time_helper.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

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
          (context, value, child) => SizedBox(
            height: 300,
            child: BarGraph(
              maxY: 200,
              sunAmount: value.calculateDailyExpenseSummary()[sunDay] ?? 0,
              monAmount: value.calculateDailyExpenseSummary()[monDay] ?? 0,
              tueAmount: value.calculateDailyExpenseSummary()[tueDay] ?? 0,
              wedAmount: value.calculateDailyExpenseSummary()[wedDay] ?? 0,
              thurAmount: value.calculateDailyExpenseSummary()[thurDay] ?? 0,
              friAmount: value.calculateDailyExpenseSummary()[friDay] ?? 0,
              satAmount: value.calculateDailyExpenseSummary()[satDay] ?? 0,
            ),
          ),
    );
  }
}
