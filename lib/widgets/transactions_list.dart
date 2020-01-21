import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Center(
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No transaction added yet!'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${transactions[index].title}',
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date)),
                    ),
                  );
                  // return Card(
                  //   child: Row(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: EdgeInsets.symmetric(
                  //           vertical: 10,
                  //           horizontal: 15,
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: Theme.of(context).primaryColor,
                  //               width: 2,
                  //             ),
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(10))),
                  //         child: Text(
                  //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.bold,
                  //             color: Theme.of(context).primaryColor,
                  //           ),
                  //         ),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: <Widget>[
                  //           Text(
                  //             transactions[index].title,
                  //             style: Theme.of(context).textTheme.title,
                  //           ),
                  //           Text(
                  //             DateFormat.yMMMd().format(transactions[index].date),
                  //             style: TextStyle(color: Colors.grey),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
