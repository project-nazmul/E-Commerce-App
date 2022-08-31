import 'package:flutter/material.dart';

textField(
    {IconData? icon,
    String? text,
    TextEditingController? controller,
    dynamic validator}) {
  return TextFormField(
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2)),
        prefixIcon: Icon(icon,
          color: Colors.blue,
        ),
        label: Text(text!),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2))
    )
  );
}
