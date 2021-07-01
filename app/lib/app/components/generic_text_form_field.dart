import 'package:flutter/material.dart';

class GenericTextFormField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType type;

  GenericTextFormField({
    Key? key,
    required this.label,
    required this.validator,
    required this.controller,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
      child: TextFormField(
        controller: this.controller,
        keyboardType: this.type,
        validator: this.validator,
        decoration: InputDecoration(labelText: this.label),
      ),
    );
  }
}
