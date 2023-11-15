// money_note.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyNote extends StatelessWidget {
  final String name;
  final DateTime? date;
  final int amount;
  final String description;

  // Konstruktor untuk kelas MoneyNote
  MoneyNote({
    Key? key,
    this.name = '',
    this.date,
    this.amount = 0,
    this.description = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Note'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Nama Transaksi: $name'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Tanggal: ${date != null ? DateFormat('dd-MM-yyyy').format(date!) : 'Tanggal tidak tersedia'}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Jumlah: $amount'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Deskripsi: $description'),
          ),
          Spacer(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
