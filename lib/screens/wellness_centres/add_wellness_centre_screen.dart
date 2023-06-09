import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/components/auth_text_field.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:relate_admin/constants/text_string.dart';
import 'package:relate_admin/screens/authentication/login_screen.dart';
import 'package:relate_admin/screens/authentication/professional/professional_disclaimer_screen.dart';
import 'package:relate_admin/services/auth.dart';
import 'package:relate_admin/components/form_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WellnessCenter {
  final String name;
  final String address;
  final String background;
  final List<String> services;
  final String criteria;
  final String website;

  WellnessCenter({
    required this.name,
    required this.address,
    required this.background,
    required this.services,
    required this.criteria,
    required this.website,
  });
}

class AddWellnessCentresScreen extends StatefulWidget {
  const AddWellnessCentresScreen({Key? key}) : super(key: key);

  @override
  _AddWellnessCentresScreenState createState() =>
      _AddWellnessCentresScreenState();
}

class _AddWellnessCentresScreenState extends State<AddWellnessCentresScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _backgroundController = TextEditingController();
  final _servicesController = TextEditingController();
  final _criteriaController = TextEditingController();
  final _websiteController = TextEditingController();

  Future<void> addWellnessCenter() async {
    final name = _nameController.text;
    final address = _addressController.text;
    final background = _backgroundController.text;
    final services = _servicesController.text;
    final criteria = _criteriaController.text;
    final website = _websiteController.text;

    try {
      // Get a reference to the Firestore collection
      final wellnessCentersCollection =
          FirebaseFirestore.instance.collection('wellnessCenters');

      // Add the wellness center data to Firestore
      await wellnessCentersCollection.add({
        'name': name,
        'address': address,
        'background': background,
        'services': services,
        'documentID': '',
        'criteria': criteria,
        'website': website,
      });

      // Clear the text fields after successful submission
      _nameController.clear();
      _addressController.clear();
      _backgroundController.clear();
      _servicesController.clear();
      _criteriaController.clear();
      _websiteController.clear();

      // Show a success message or navigate to a new page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wellness Center added successfully')),
      );
    } catch (error) {
      // Show an error message if adding the wellness center fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add wellness center')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Wellness Center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _backgroundController,
              decoration: InputDecoration(labelText: 'Background'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _servicesController,
              decoration: InputDecoration(labelText: 'Services'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _criteriaController,
              decoration: InputDecoration(labelText: 'Criteria'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _websiteController,
              decoration: InputDecoration(labelText: 'Website'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addWellnessCenter,
              child: Text('Add Wellness Center'),
            ),
          ],
        ),
      ),
    );
  }
}
