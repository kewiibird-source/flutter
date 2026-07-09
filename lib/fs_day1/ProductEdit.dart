import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import '../firebase_options.dart';
import 'ProductList.dart';

class ProductEdit extends StatefulWidget {
  final String docId;
  const ProductEdit({super.key, required this.docId});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
