import 'package:flutter/material.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
    );
  }
}
