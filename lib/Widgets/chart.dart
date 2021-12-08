import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:personal_app/model/transaction.dart';
import 'chart_bar.dart';

//List arr = ['St', 'Sun', 'Mon', 'Tus', 'Wed', 'Sur', 'Fri'];

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      int t = ((weekDay.day).toInt()) % 7;
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': weekDay.day,
        // 'day' :arr[t];
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'].toString(),
                  double.parse(data['amount'].toString()),
                  totalspending == 0
                      ? 0.0
                      : double.parse(data['amount'].toString()) / totalspending,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
