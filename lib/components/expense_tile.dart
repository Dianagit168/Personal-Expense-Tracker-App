import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String? name;
  final String? amount;
  final DateTime? dateTime;
  const ExpenseTile({super.key, this.name, this.amount, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name!),
      subtitle: Text('${dateTime!.day}/${dateTime!.month}/${dateTime!.year}'),
      trailing: Text('\$${amount!}'),
    );
  }
}
