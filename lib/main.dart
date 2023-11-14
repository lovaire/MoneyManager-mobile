import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/widgets/left_drawer.dart';
import 'package:moneymanager/moneyform.dart';
import 'package:moneymanager/widgets/moneycard.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  final String name;
  final String category;
  final int amount;
  final String description;
  final DateTime date;

  Transaction({
    required this.name,
    required this.category,
    required this.amount,
    required this.description,
    required this.date,
  });
}

class AddForm extends StatelessWidget {
  final void Function(Transaction) addTransaction;
  const AddForm({Key? key, required this.addTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddForm(addTransaction: addTransaction); // Pass it directly
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  int calculateTotalSaldo() {
    int totalSaldo = 0;
    for (var transaction in transactions) {
      if (transaction.category == 'Masuk') {
        totalSaldo += transaction.amount;
      } else {
        totalSaldo -= transaction.amount;
      }
    }
    return totalSaldo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Money Manager',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddForm(
                    addTransaction: addTransaction,
                  ),
                ),
              );
            },
            child: Text('Tambah Transaksi'),
          ),
          AddForm(addTransaction: addTransaction),
          SizedBox(height: 20),
          Text(
            'Total Saldo: ${calculateTotalSaldo()}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          DataTable(
            columns: const [
              DataColumn(label: Text('Nama Transaksi')),
              DataColumn(label: Text('Kategori')),
              DataColumn(label: Text('Jumlah')),
              DataColumn(label: Text('Deskripsi')),
              DataColumn(label: Text('Tanggal')),
              DataColumn(label: Text('Aksi')),
            ],
            rows: List<DataRow>.generate(
              transactions.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(transactions[index].name)),
                  DataCell(Text(transactions[index].category)),
                  DataCell(Text(transactions[index].amount.toString())),
                  DataCell(Text(transactions[index].description)),
                  DataCell(Text(DateFormat('dd-MM-yyyy')
                      .format(transactions[index].date))),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTransaction(index),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
