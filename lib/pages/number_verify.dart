import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../components/button.dart';
import 'otp_verify.dart';

class NumberVerfy extends StatefulWidget {
  NumberVerfy({super.key});

  @override
  State<NumberVerfy> createState() => _NumberVerfyState();
}

class _NumberVerfyState extends State<NumberVerfy> {
  var phone="";
  TextEditingController CodeController = TextEditingController();


  @override
  void initState(){
    //TODO: implement initState
    CodeController.text= "+91";
    super.initState();
  }
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
                "Please enter your mobile number",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              const Text(
                "You'll receive a 6 digit code to verify next.",
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Flag(Flags.india,size: 25,),
                         Padding(
                          padding: EdgeInsets.all(4.0),
                          child: SizedBox(
                              width: 30,
                              child:TextField(
                                controller: CodeController,
                              ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("-",style: TextStyle(fontSize:25),),
                        ),
                        SizedBox(
                          width: w * .56,
                          child: TextFormField(
                            onChanged: (value){
                              phone=value;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Mobile Number",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Button(
                  text: "CONTINUE",
                  btn: () async {

                    await FirebaseAuth.instance.verifyPhoneNumber(
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException ex) {},
                        codeSent: (String verificationid, int? resendToken) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OtpVerify(number:phone, verificationId:verificationid,),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                        phoneNumber: '${CodeController.text+ phone}');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
