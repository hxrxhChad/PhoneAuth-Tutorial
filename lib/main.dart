// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth/NextScreen.dart';
import 'package:phone_auth/authPage.dart';
import 'package:phone_auth/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

const primaryColor = Color.fromARGB(255, 36, 40, 101);
const secondaryColor = Color.fromARGB(255, 77, 77, 79);
const bodyTextColor = Color.fromARGB(255, 33, 33, 34);
const bgColor = Color.fromARGB(255, 207, 207, 211);

const defaultPadding = 20.0;
const defaultDuration = Duration(seconds: 1);

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              ),
        ),
        home: LanguagePage(),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
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
            Image.asset("assets/icons8-image-96.png"),
            SizedBox(
              height: defaultPadding,
            ),
            Center(
              child: Text(
                "Please select your Language",
                style: Theme.of(context).textTheme.headline6!,
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Text(
              "You can change the language \nat any time.",
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
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration:
                    BoxDecoration(border: Border.all(color: primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "English",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: primaryColor, fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            // print("okk");
            //     ap.isSignedIn == true
            //         ? Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => const NextScreen(),
            //             ),
            //           )
            //         : Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => const AuthPage(),
            //             ),
            //           );
            ElevatedButton(
              onPressed: () {
                print("okk");
                ap.isSignedIn == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextScreen(),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ),
                      );
              },
              style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primaryColor),
                      minimumSize:
                          MaterialStatePropertyAll(Size.fromHeight(50)))
                  .copyWith(
                      minimumSize: MaterialStatePropertyAll(Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.8))),
              child: Center(
                child: Text(
                  "NEXT",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
