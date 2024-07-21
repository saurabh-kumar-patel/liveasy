
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../components/button.dart';
import 'home.dart';

class OtpVerify extends StatefulWidget {
  var number;
  String verificationId;
  OtpVerify({super.key, required this.number, required this.verificationId});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  TextEditingController otp = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: w,
        height: h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verify Phone",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              Text(
                "Code is sent to ${widget.number}",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Pinput(
                  controller: otp,
                  length: 6,
                  showCursor: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code?"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Request Again",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Button(
                  text: "VERIFY AND CONTINUE",
                  btn: () async {
                    try {
                      PhoneAuthCredential crendential =
                          PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otp.text.toString(),);
                   auth.signInWithCredential(crendential).then((value){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>Home()));Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>Home()));
                   }, );
                    } catch (ex) {
                      log(ex.toString());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
