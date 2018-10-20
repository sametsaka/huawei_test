import 'package:flutter/material.dart';
import 'package:huawei_test/screens/payment_entry.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget bodyData() => DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Text("Ürün Adı"),
            numeric: false,
            onSort: (i, b) {},
            tooltip: "Ürün Adı",
          ),
          DataColumn(
            label: Text("Fiyat"),
            numeric: true,
            onSort: (i, b) {},
            tooltip: "Fiyat",
          ),
          DataColumn(
            label: Text("Tarih"),
            numeric: false,
            onSort: (i, b) {},
            tooltip: "Tarih",
          ),
        ], rows: <DataRow>[],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Payment_entry()));
          }),
      appBar: new AppBar(
        title: new Text("Hesap Cüzdanı Ana Sayfa"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: bodyData(),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("aa"),
              accountEmail: null,
            ),
            new ListTile(
              title: new Text("Ben"),
              trailing: new Icon(Icons.account_circle),
            ),
            new ListTile(
              title: new Text("Harcamalarım"),
              trailing: new Icon(Icons.attach_money),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Ayarlar"),
              trailing: new Icon(Icons.settings),
            )
          ],
        ),
      ),
    );
  }
}
