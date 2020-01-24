import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String text;
  final String labelName;
  final int maxLength;
  final TextInputType typeInput;
  final bool obscureText;

  InputWidget(this.text, this.maxLength, this.labelName, this.typeInput,
      this.obscureText);

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
      padding: const EdgeInsets.all(2.0),
      color: Colors.white,
      child: new Container(
        width: MediaQuery.of(context).size.width - 10,
        child: new Material(
            child: new Column(children: [
          new Padding(padding: EdgeInsets.only(top: 0)),
          new TextFormField(
            cursorColor: Color(0xFFFF4F10),
            initialValue: text,
            maxLength: maxLength,
            autocorrect: true,
            obscureText: obscureText,
            decoration: new InputDecoration(
              labelStyle: TextStyle(color: Color(0xFF014B8E)),
              labelText: labelName,
              hintStyle: TextStyle(color: Color(0xFF014B8E), fontSize: 10),
              fillColor: Colors.red,
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              errorStyle: TextStyle(color: Colors.red),
              //icon: new Icon(Icons.card_giftcard),
              isDense: true,
            ),
            validator: (val) {
              if (val.length == 0) {
                return "Email cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: typeInput,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ])),
      ),
    ));
  }
}
