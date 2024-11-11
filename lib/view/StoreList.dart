import 'package:flutter/material.dart';

class storeList extends StatefulWidget {
  const storeList({super.key});

  @override
  State<storeList> createState() => _storeListState();
}

class _storeListState extends State<storeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Overview'),
      ),
    );
  }
}
