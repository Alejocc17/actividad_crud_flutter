import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBox(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this._label,
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 46, 125, 60),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 45, 124, 60)),
            ),
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}
