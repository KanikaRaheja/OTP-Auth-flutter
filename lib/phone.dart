import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MYPhone extends StatefulWidget {
  const MYPhone({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<MYPhone> createState() => _MYPhoneState();
}

class _MYPhoneState extends State<MYPhone> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image1.png'),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Verification",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We need to verify your phone number before getting started !",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: countrycode,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("|",
                            style: TextStyle(fontSize: 33, color: Colors.grey)),
                        Expanded(
                            child: TextField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            phone = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Phone",
                          ),
                        )),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '${countrycode.text + phone}',
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              MYPhone.verify = verificationId;
                              Navigator.pushNamed(context, "otp");
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );

                          // Navigator.pushNamed(context, "otp");
                        },
                        child: Text('Send the code'),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(201, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )
                  ]),
            )));
  }
}
