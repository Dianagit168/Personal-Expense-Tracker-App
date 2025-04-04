import 'package:hive/hive.dart';
import 'package:personal_expense_tracker_app/models/expense_items.dart';

class HiveDatabase {
  final _myBox = Hive.box("expense_database");

  void saveData(List<ExpenseItemsModel> allExpense) {
    List<List<dynamic>> allExpensesFormat = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormat.add(expenseFormatted);
    }
    _myBox.put("ALL_EXPENSES", allExpensesFormat);
  }

  //Save
  List<ExpenseItemsModel> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItemsModel> allExpenses = [];
    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];
      ExpenseItemsModel expense = ExpenseItemsModel(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
