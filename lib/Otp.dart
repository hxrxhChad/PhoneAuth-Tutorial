// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:phone_auth/ProfileSelector.dart';
import 'package:phone_auth/main.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

class OtpPage extends StatefulWidget {
  final String verificationId;
  const OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/wavy.jpg",
                ),
                alignment: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Verify Phone",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              "Code is sent to your Phone Number",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.black38),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: PinPut(
                  fieldsCount: 6,
                  onSubmit: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                  eachFieldConstraints: BoxConstraints(
                    minHeight: 50,
                    minWidth: 50,
                  ),
                  withCursor: true,
                  textStyle: TextStyle(color: Colors.white),
                  followingFieldDecoration:
                      BoxDecoration(color: Color.fromARGB(255, 67, 146, 211)),
                  submittedFieldDecoration:
                      BoxDecoration(color: Color.fromARGB(255, 67, 146, 211)),
                  disabledDecoration:
                      BoxDecoration(color: Color.fromARGB(255, 67, 146, 211)),
                  selectedFieldDecoration:
                      BoxDecoration(color: Color.fromARGB(255, 67, 146, 211))),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Didn't recieve the code?  ",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.black38)),
              TextSpan(
                  text: "Request Again",
                  style: Theme.of(context).textTheme.subtitle2!)
            ])),
            SizedBox(
              height: defaultPadding,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileSelector()),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 36, 40, 101)),
                child: Center(
                  child: Text(
                    " VERIFY AND CONTINUE",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
