import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinns_books/Controllers/firebaseController.dart';
import 'package:flutter/material.dart';
import 'package:vinns_books/views/bookDataView.dart';
import 'package:vinns_books/views/login_Viewer.dart';

import 'bookCadastro.dart';

class homeViewer extends StatefulWidget {
  @override
  _homeViewrState createState() => _homeViewrState();
}

final cor = 0xff5c2441;
final cor2 = 0xffb34866;
final cor3 = 0xff4b7c9;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class _homeViewrState extends State<homeViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(cor2),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Emison"),
                  ],
                ),
                color: Color(cor),
                height: MediaQuery.of(context).size.height / 4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 17,
                    ),
                    Icon(Icons.save_sharp),
                    FlatButton(
                      child: Text("Cadastrar Livros"),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookCadas();
                        }));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 17,
                    ),
                    Icon(Icons.logout),
                    FlatButton(
                      child: Text("Sair"),
                      onPressed: () {
                        signOut();
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginV();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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

signOut() async {
  await firebaseAuth.signOut();
}

user() async {
  AuthCredential credential;
  final AuthResult authResult =
  await FirebaseAuth.instance.signInWithCredential(credential);
  final FirebaseUser Currentuser = authResult.user;
  return user;
}