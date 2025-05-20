import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker_app/components/expense_summary.dart';
import 'package:personal_expense_tracker_app/components/expense_tile.dart';
import 'package:personal_expense_tracker_app/components/my_btn.dart';
import 'package:personal_expense_tracker_app/provider/expanse_datas.dart';
import 'package:personal_expense_tracker_app/models/expense_items.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpNameController = TextEditingController();
  final newExpDollarController = TextEditingController();
  final newExpCentController = TextEditingController();
  final email = FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    context.read<ExpanseDatasProvider>().prepareData();
    super.initState();
  }

  //
  void clear() {
    newExpDollarController.clear();
    newExpNameController.clear();
    newExpCentController.clear();
  }

  // delete
  void deleteExpense(ExpenseItemsModel expense) {
    context.read<ExpanseDatasProvider>().deleteExpense(expense);
  }

  // save
  void save() {
    if (newExpCentController.text.isNotEmpty &&
        newExpDollarController.text.isNotEmpty &&
        newExpNameController.text.isNotEmpty) {
      String amount =
          '${newExpDollarController.text}.${newExpCentController.text}';

      ExpenseItemsModel newExpense = ExpenseItemsModel(
        name: newExpNameController.text,
        amount: amount,
        dateTime: DateTime.now(),
      );
      context.read<ExpanseDatasProvider>().addNewExpense(newExpense);
    }

    clear();
    Navigator.pop(context);
  }

  // cancel
  void cancel() {
    clear();
    Navigator.pop(context);
  }

  //Signout

  //
  void addNewexpense() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Add new expense'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newExpNameController,
                  decoration: InputDecoration(hintText: 'Expense Name'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: newExpDollarController,
                        decoration: InputDecoration(hintText: 'Dollars'),
                      ),
                    ),

                    Expanded(
                      child: TextField(
                        controller: newExpCentController,
                        decoration: InputDecoration(hintText: 'Cents'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              MaterialButton(onPressed: save, child: Text('Save')),
              MaterialButton(onPressed: cancel, child: Text('Cancel')),
            ],
          ),
    );
  }

  void signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpanseDatasProvider>(
      builder: (
        BuildContext context,
        ExpanseDatasProvider value,
        Widget? child,
      ) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: addNewexpense,
              child: Icon(Icons.add, color: Colors.white),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  //================== Bar Chart =====================
                  ExpenseSummary(startOfWeek: value.startOfWeekDate()),

                  SizedBox(height: 30),
                  //================== List of Expenses =====================
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.getAllExpenseLists().length,
                    itemBuilder: (context, index) {
                      return ExpenseTile(
                        name: value.getAllExpenseLists()[index].name!,
                        amount: value.getAllExpenseLists()[index].amount,
                        dateTime: value.getAllExpenseLists()[index].dateTime,
                        deleteExpense:
                            () => deleteExpense(
                              value.getAllExpenseLists()[index],
                            ),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Loged: $email ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        // fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(child: MyBotton(onTap: signOut, btnName: 'Sign Out')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
