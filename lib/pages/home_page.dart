import 'package:flutter/material.dart';

import '../components/button.dart';
import 'number_verify.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? SelectOption;
  List<String> option = ["English", "Hindi"];
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: w,
        height: h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.photo_outlined,
                size: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Please Select your Language",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "You can change the language at any time.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              DropdownButton<String>(
                  hint: const Text(
                    "English",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  value: SelectOption,
                  items: option.map((String option) {
                    return DropdownMenuItem(value: option, child: Text(option));
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      SelectOption = newvalue;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              Button(
                  text: "NEXT",
                  btn: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NumberVerfy()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
