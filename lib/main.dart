import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class KeuanganItem {
  String nama;
  String kategori;
  int amount;
  DateTime tanggal;

  KeuanganItem({
    required this.nama,
    required this.kategori,
    required this.amount,
    required this.tanggal,
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<KeuanganItem> items = [];
  int totalAmount = 0;

  TextEditingController namaController = TextEditingController();
  String selectedKategori = "Masuk";
  TextEditingController amountController = TextEditingController();
  DateTime tanggal = DateTime.now();

  void tambahItem() {
    String nama = namaController.text;
    String kategori = selectedKategori;
    int amount = int.tryParse(amountController.text) ?? 0;

    if (nama.isNotEmpty && amount > 0) {
      KeuanganItem item = KeuanganItem(
        nama: nama,
        kategori: kategori,
        amount: amount,
        tanggal: tanggal,
      );
      setState(() {
        items.add(item);
        totalAmount += (kategori == "Masuk") ? amount : -amount;
      });

      namaController.clear();
      amountController.clear();
      tanggal = DateTime.now();
    }
  }

  void hapusItem(int index) {
    setState(() {
      totalAmount -= (items[index].kategori == "Masuk")
          ? items[index].amount
          : -items[index].amount;
      items.removeAt(index);
    });
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MoMa Money Manager - bykyye.corp'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              DropdownButton<String>(
                value: selectedKategori,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedKategori = newValue!;
                  });
                },
                items: <String>['Masuk', 'Keluar']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Jumlah'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Tanggal: ${DateFormat('dd-MM-yyyy').format(tanggal)}',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: tanggal,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        setState(() {
                          tanggal = selectedDate;
                        });
                      }
                    },
                    child: Text('Ubah Tanggal'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  tambahItem();
                  _showSnackbar('Kamu telah menekan tombol Tambah Item');
                },
                child: Text('Simpan Catatan'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showSnackbar('Kamu telah menekan tombol Lihat Item');
                },
                child: Text('Lihat Item'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showSnackbar('Kamu telah menekan tombol Logout');
                },
                child: Text('Logout'),
              ),
              SizedBox(height: 20),
              Text('Saldo Anda: $totalAmount'),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    KeuanganItem item = items[index];
                    return Card(
                      child: ListTile(
                        onTap: () {
                          _showSnackbar('Kamu telah menekan item ${item.nama}');
                        },
                        title: Text(item.nama),
                        subtitle: Text(
                          '${item.kategori} - ${DateFormat('dd-MM-yyyy').format(item.tanggal)}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Rp ${item.amount}'),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => hapusItem(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
