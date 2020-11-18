import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vinns_books/views/home_View.dart';
import 'package:vinns_books/views/login_Viewer.dart';
void main() async {

  runApp(MaterialApp(

    home: LoginV(),
    debugShowCheckedModeBanner: false,

  ));
QuerySnapshot snapshot=await Firestore.instance.collection("Teste").getDocuments();
snapshot.documents.forEach((d) {print(d.data); });



}
