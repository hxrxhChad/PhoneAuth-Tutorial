// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:phone_auth/ProfileSelector.dart';
import 'package:phone_auth/main.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
              "Code is sent to +911234567890",
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
