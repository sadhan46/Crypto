import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protto_assignment/Provider/MyCoinsProvider.dart';
import 'package:protto_assignment/Screens/Navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        ),
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Coins>(
          create: (context) => Coins(),
          builder: (context, child) {
            return Navigation();
          }),
    );
  }
}

