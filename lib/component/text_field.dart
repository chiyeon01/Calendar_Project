import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({
    required this.onSaved,
    required this.validator,
    required this.label,
    this.expand = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!expand)
        RenderTextField(),
        if (expand)
        Expanded(
          child: RenderTextField(),
        ),
      ],
    );
  }

  RenderTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      onSaved: onSaved,
      validator: validator,
      cursorColor: Colors.black,
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
    );
  }
}