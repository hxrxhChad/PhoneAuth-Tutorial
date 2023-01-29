// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations, unused_local_variable

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/Otp.dart';
import 'package:phone_auth/main.dart';
import 'package:phone_auth/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
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
            IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const OtpPage(verificationId: "")));
                },
                icon: Icon(
                  Icons.turn_right_outlined,
                  color: primaryColor,
                )),
            Center(
              child: Text(
                "Please select your mobile number",
                style: Theme.of(context).textTheme.headline6!,
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              "You'll recieve a 6 digit code\nto verify next.",
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
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 20),
                cursorColor: primaryColor,
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Enter phone Number",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black45),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    suffixIcon: phoneController.text.length > 9
                        ? Icon(
                            Icons.done,
                            color: primaryColor,
                          )
                        : null,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 500,
                                  backgroundColor: Colors.white12,
                                  borderRadius: BorderRadius.circular(0)),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            InkWell(
              onTap: () => sendPhoneNumber(),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 36, 40, 101)),
                child: Center(
                  child: Text(
                    "CONTINUE",
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

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.countryCode}$phoneNumber");
  }
}
