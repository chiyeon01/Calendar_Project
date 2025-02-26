import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand;

  const CustomTextField({
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
      cursorColor: Colors.black,
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
    );
  }
}