import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final double amount;
  final String title;
  final DateTime date;
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
