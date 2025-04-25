import 'package:expenditure_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expenditure_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
          ),
          child: ExpenseItem(
            expenses[index],
          )),
    );
  }
}
