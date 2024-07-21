import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  var text;
  final VoidCallback btn;
  Button({super.key, required this.text, required this.btn});
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.9,
      color: Colors.blue,
      child: TextButton(
        onPressed: btn,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
