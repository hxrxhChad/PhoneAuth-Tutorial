// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_question_mark, prefer_void_to_null, camel_case_types, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:phone_auth/NextScreen.dart';
import 'package:phone_auth/main.dart';

enum profile { shipper, transporter }

class ProfileSelector extends StatefulWidget {
  const ProfileSelector({super.key});

  @override
  State<ProfileSelector> createState() => _ProfileSelectorState();
}

class _ProfileSelectorState extends State<ProfileSelector> {
  profile _sele = profile.shipper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Please select your profile",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(border: Border.all(color: primaryColor)),
            child: Row(
              children: [
                Radio(
                  focusColor: primaryColor,
                  activeColor: primaryColor,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => primaryColor),
                  value: profile.shipper,
                  groupValue: _sele,
                  onChanged: (profile? value) {
                    setState(() {
                      _sele = value!;
                    });
                  },
                ),
                Icon(
                  Icons.house_siding_outlined,
                  color: Colors.black,
                  size: 48,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipper",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Lorem ipsum dolor sit\n amait,consectetur\n adipsing",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(border: Border.all(color: primaryColor)),
            child: Row(
              children: [
                Radio(
                  focusColor: primaryColor,
                  activeColor: primaryColor,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => primaryColor),
                  value: profile.transporter,
                  groupValue: _sele,
                  onChanged: (profile? value) {
                    setState(() {
                      _sele = value!;
                    });
                  },
                ),
                Icon(
                  Icons.fire_truck_outlined,
                  color: Colors.black,
                  size: 48,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transporter",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Lorem ipsum dolor sit\n amait,consectetur\n adipsing",
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NextScreen()),
              );
            },
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
    ));
  }
}
