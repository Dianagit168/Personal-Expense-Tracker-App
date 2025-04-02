import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/datetime/date_time_helper.dart';
import 'package:personal_expense_tracker_app/models/expense_items.dart';

class ExpanseDatasProvider with ChangeNotifier {
  // list of all expenses
  List<ExpenseItemsModel> overallExpenseList = [];

  // get expense list
  List<ExpenseItemsModel> getAllExpenseLists() {
    return overallExpenseList;
  }

  // add new expense
  void addNewExpense(ExpenseItemsModel newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  // delete expense
  void deleteNewExpense(ExpenseItemsModel expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  // get weekday(Mon, tue,etc) from the daetime obj
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  // get the date for the start of the week(sunday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;
    // get today date
    DateTime today = DateTime.now();

    // go backwards from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  //
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime!);
      double amount = double.parse(expense.amount!);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
