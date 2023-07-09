import 'package:flutter/material.dart';

class DashboardComponent extends StatefulWidget {
  const DashboardComponent({super.key});

  @override
  State<DashboardComponent> createState() => _DashboardComponentState();
}

class _DashboardComponentState extends State<DashboardComponent> {
  @override
  Widget build(BuildContext context) {
     return Center(child: Text('Dashboard'));
  }
}