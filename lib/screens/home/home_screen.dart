import 'package:flutter/material.dart';
import 'package:relate_admin/screens/verify_professionals/verify_professionals_screen.dart';
import 'package:relate_admin/screens/wellness_centres/add_wellness_centre_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Relate Admin")),
      body: SafeArea(
          child: Center(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AddWellnessCentresScreen()));
              },
              child: const Text("Add Wellness Centres")),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const VerifyProfessionalsScreen()));
              },
              child: const Text("View Professionals"))
        ],
      ))),
    );
  }
}
