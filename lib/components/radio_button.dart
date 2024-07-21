import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  RadioButton({
    super.key,
    required this.Value,
    required this.selectoption,
    required this.btn,
    required this.icon,
    required this.txt1,
  });


  String Value;
  String selectoption;
  void Function(String) btn;
  IconData icon;
  var txt1;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      width: w,
      height: h * 0.13,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Radio(
              value:Value,
              groupValue: selectoption,
              onChanged: (value) => btn,
            ),
          ),
          Icon(
           icon,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "Lorem ipsum  dolor sit amet,",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                const Text(
                  "consectetur adipiscing,",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
