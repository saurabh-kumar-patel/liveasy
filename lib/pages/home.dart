import 'package:flutter/material.dart';

import '../components/button.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedoption = "non selected";

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    print("hey");
    return Scaffold(
      body: SizedBox(
        width: w,
        height: h,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Please select your profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
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
                        value:"option1",
                        groupValue: selectedoption,
                        onChanged: (value){
                          setState(() {
                            selectedoption=value!;
                          });
                        },
                      ),
                    ),
                    const Icon(
                      Icons.home_work,
                      size: 35,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipper",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Lorem ipsum  dolor sit amet,",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          ),
                          Text(
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
              ),
              const SizedBox(height: 5),
              Container(
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
                        value:"option2",
                        groupValue: selectedoption,
                        onChanged: (value){

                          setState(() {
                            selectedoption=value!;
                          });
                        },
                      ),
                    ),
                    const Icon(
                      Icons.local_shipping_outlined,
                      size: 35,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transporter",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Lorem ipsum  dolor sit amet,",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,

                            ),
                            textAlign: TextAlign.end
                            ,
                          ),
                          Text(
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
              ),
              const SizedBox(height: 20),
              Button(text: "CONTINUE", btn: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
