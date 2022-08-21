import 'package:flutter/material.dart';

class FavoriteQuotesSreene extends StatefulWidget {
  const FavoriteQuotesSreene({Key? key}) : super(key: key);

  @override
  State<FavoriteQuotesSreene> createState() => _FavoriteQuotesSreene();
}

class _FavoriteQuotesSreene extends State<FavoriteQuotesSreene> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
          child: Text(
        "favorite",
        style: TextStyle(color: Colors.black, fontSize: 25),
      )),
    );
  }
}
