import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String? name;
  final String? amount;
  final DateTime? dateTime;
  final void Function() deleteExpense;

  const ExpenseTile({
    super.key,
    this.name,
    this.amount,
    this.dateTime,
    required this.deleteExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(name!),
          IconButton(
            onPressed: deleteExpense,
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      subtitle: Text('${dateTime!.day}/${dateTime!.month}/${dateTime!.year}'),
      trailing: Text('\$${amount!}'),
    );
  }
}
