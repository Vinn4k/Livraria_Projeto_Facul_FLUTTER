import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vinns_books/views/bookDataView.dart';

import 'bookCadastro.dart';

class homeViewer extends StatefulWidget {
  @override
  _homeViewrState createState() => _homeViewrState();
}

final cor = 0xff5c2441;
final cor2 = 0xffb34866;
final cor3 = 0xff4b7c9;

class _homeViewrState extends State<homeViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 400,
            ),
            Container(
              child: FlatButton(
                child: Text("Cadastrar Livros"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookCadas();
                  }));
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(cor),
        title: Center(
          child: Text(
            "Livraria Book",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      backgroundColor: Color(cor3),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('book').snapshots(),
              builder: (context, snapshots) {
                switch (snapshots.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<DocumentSnapshot> documents = snapshots.data.documents;
                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: bookData(documents[index].data));
                      },
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
