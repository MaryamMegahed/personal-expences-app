import 'package:flutter/material.dart';
import '../model/transaction.dart';
//import 'package:intl/intl.dart';

// class TransactionList extends StatefulWidget {

//   @override
//   _TransactionListState createState() => _TransactionListState();
// }

// class _TransactionListState extends State<TransactionList> {
class transactionList extends StatelessWidget {
  final List transactions;
  transactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text('\$${transactions[index].amount}'),
                    ),
                  ),
                ),
                title: Text(transactions[index].title,
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                subtitle: Text(
                  transactions[index].date.toString(),
                ),
              ),
            );
            // return Card(
            //     child: Row(
            //   children: <Widget>[
            //     Container(
            //       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //         color: Theme.of(context).primaryColor,
            //         width: 2,
            //       )),
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         '\$${transactions[index].amount.toStringAsFixed(2)}',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Theme.of(context).primaryColor,
            //           fontSize: 20,
            //         ),
            //       ),
            //     ),
            //     Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           transactions[index].title,
            //           style: TextStyle(fontSize: 20, color: Colors.black),
            //         ),
            //         Text(
            //           transactions[index].date.toString(),
            //           style: TextStyle(fontSize: 16, color: Colors.grey),
            //         )
            //       ],
            //     ),
            //   ],
            // ));
          },
          itemCount: transactions.length,
        ));
  }
}
