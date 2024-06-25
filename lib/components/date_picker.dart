import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final String hintText;
  final bool obscureText;

  const DatePicker(
      {super.key,
      required this.controller,
      required this.labeltext,
      required this.hintText,
      required this.obscureText});

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      controller.text = picked.toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600, width: 2)),
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.grey.shade600),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () => selectDate(context),
      ),
    );
  }
}
