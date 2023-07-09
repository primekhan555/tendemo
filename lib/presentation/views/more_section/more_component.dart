import 'package:flutter/material.dart';

class MoreComponent extends StatefulWidget {
  const MoreComponent({super.key});

  @override
  State<MoreComponent> createState() => _MoreComponentState();
}

class _MoreComponentState extends State<MoreComponent> {
  @override
  Widget build(BuildContext context) {
     return Center(child: Text('More'));
  }
}