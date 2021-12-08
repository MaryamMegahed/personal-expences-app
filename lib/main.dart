import 'package:flutter/material.dart';
import 'Widgets/new_transaction.dart';
import 'Widgets/transaction_list.dart';
import 'Widgets/user_transaction.dart';
import 'Widgets/chart.dart';
import 'model/transaction.dart';
import 'src/Personal_App.dart';
//import 'model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String titleinput = "";
  // String amountinput = "";
  // final titlecontroller = TextEditingController();
  // final amountcontroller = TextEditingController();
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 'A1', title: 'new shoes', amount: 99.9, date: DateTime.now()),
    Transaction(id: 'A2', title: 'new book', amount: 95, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Personal Expenses'),
          backgroundColor: Colors.purple,
          actions: <Widget>[
            IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: Icon(Icons.add),
            )
          ]),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/pics/app6.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  width: 200,
                  child: Text('chart'),
                ),
              ),
              Chart(_recentTransactions),
              transactionList(_userTransaction),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransaction(context),
          child: Icon(Icons.add)),
    );
  }
}
