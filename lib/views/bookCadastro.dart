import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class _BookCadasState extends State<BookCadas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
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
                Text("Cadastrar novo Livro"),
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
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                  controller: discricaoC,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Este Campo Não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Descrição",
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
                Center(
                  child: FlatButton(
                    child: Text("Cadastrar"),
                    onPressed: () async {
                      if (form.currentState.validate()) {
                        print('valdo');
                        await Firestore.instance
                            .collection("book")
                            .document(tituloC.text)
                            .setData({
                          'Titulo': tituloC.text,
                          'desc': discricaoC.text,
                          'editora': editoraC.text,
                          'linkpdf': linkpdfC.text,
                          'imgLink': imglinkC.text
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
