import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinns_books/Controllers/firebaseController.dart';
import 'package:flutter/services.dart';

import 'home_View.dart';

class BookCadas extends StatefulWidget {
  @override
  _BookCadasState createState() => _BookCadasState();
}

var form = GlobalKey<FormState>();
var tituloC = TextEditingController();
var discricaoC = TextEditingController();
var editoraC = TextEditingController();
var linkpdfC = TextEditingController();
var imglinkC = TextEditingController();
final cor = 0xff5c2441;
final cor2 = 0xffb34866;
final cor3 = 0xff4b7c9;
bool isloading = false;
String tes = "";

class _BookCadasState extends State<BookCadas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Container(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                ),
                Text(
                  "Cadastrar novo Livro",
                  style: TextStyle(
                    color: Color(cor2),
                    fontFamily: 'Ral',
                    fontSize: MediaQuery.of(context).size.width * 0.09,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: tituloC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Titulo",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      tes = "";
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(235),
                  ],
                  controller: discricaoC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Descrição limite de 235 Caracteres ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: editoraC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Editora",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: linkpdfC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Link PDf",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                  controller: imglinkC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Teste",
                    labelText: "Link Imagem",
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                Text(tes),
                Center(

                  child: FlatButton(
                    color: Color(cor),
                    child: isloading ? CircularProgressIndicator()
                        : Text("Cadastrar", style: TextStyle(
                        color: Colors.white
                    ),),
                    onPressed: () async {
                      if (form.currentState.validate()) {
                        setState(() {
                          isloading = true;
                        });
                        print('valdo');
                        await Firestore.instance
                            .collection("book")
                            .document(tituloC.text)
                            .setData({
                          'Titulo': tituloC.text,
                          'desc': discricaoC.text,
                          'editora': editoraC.text,
                          'linkpdf': linkpdfC.text,
                          'imgLink': imglinkC.text,
                        });
                        setState(() {
                          isloading = false;
                          tituloC.text = "";
                          discricaoC.text = "";
                          editoraC.text = "";
                          linkpdfC.text = "";
                          imglinkC.text = "";
                          tes = "Cadastro Realizado";
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
