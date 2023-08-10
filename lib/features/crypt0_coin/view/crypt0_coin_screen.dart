import 'package:flutter/material.dart';

class Crypt0CoinScreen extends StatefulWidget {
  const Crypt0CoinScreen({super.key});

  @override
  State<Crypt0CoinScreen> createState() => _Crypt0CoinScreenState();
}

class _Crypt0CoinScreenState extends State<Crypt0CoinScreen> {
  String? coinName;


  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');


    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Text(coinName ?? "..." ),
      ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}