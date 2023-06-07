import 'package:flutter/material.dart';

class AddWellnessCentresScreen extends StatefulWidget {
  const AddWellnessCentresScreen({super.key});

  @override
  State<AddWellnessCentresScreen> createState() =>
      _AddWellnessCentresScreenState();
}

class _AddWellnessCentresScreenState extends State<AddWellnessCentresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: const [
          Text(
            "Add Wellness Centres",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ));
  }
}
