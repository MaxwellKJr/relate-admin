import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:relate_admin/services/post_services.dart';
import 'package:relate_admin/constants/size_values.dart';

class ViewProfessionalDetailsScreen extends StatefulWidget {
  final String professionalId, userName, email;
  final bool isVerified;

  const ViewProfessionalDetailsScreen(
      {super.key,
      required this.professionalId,
      required this.userName,
      required this.email,
      required this.isVerified});
  @override
  State<ViewProfessionalDetailsScreen> createState() =>
      _ViewProfessionalDetailsScreenState();
}

class _ViewProfessionalDetailsScreenState
    extends State<ViewProfessionalDetailsScreen> {
  Future<void> verifyAccount() async {
    final user = FirebaseAuth.instance;
    final uid = user.currentUser?.uid;

    final professionalDoc = await FirebaseFirestore.instance
        .collection('professionals')
        .doc(widget.professionalId)
        .get();

    final professionalData = professionalDoc.data();
    final isVerified = professionalData?['isVerified'];

    final professionalRef = FirebaseFirestore.instance
        .collection('professionals')
        .doc(widget.professionalId);
    await professionalRef.update({'isVerified': !isVerified});
  }

  @override
  Widget build(BuildContext context) {
    final professionalId = widget.professionalId;

    return Scaffold(
        appBar: AppBar(title: Text(widget.userName)),
        body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(layoutPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.isVerified.toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: elementSpacing),
                                  Text(
                                    "Background",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    widget.email,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: elementSpacing),
                                  Text(
                                    "Services",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  widget.isVerified
                                      ? Text("Verified")
                                      : Text("Not Verified"),
                                  OutlinedButton(
                                      onPressed: () {
                                        verifyAccount();
                                      },
                                      child: widget.isVerified
                                          ? Text("Unverify Account")
                                          : Text("Verify Account")),
                                  // if (widget.image != '')
                                  //   Container(
                                  //       padding: const EdgeInsets.only(top: 10),
                                  //       child: ClipRRect(
                                  //         borderRadius:
                                  //             BorderRadius.circular(20.0),
                                  //         child: Image.network(
                                  //           widget.image,
                                  //           fit: BoxFit.cover,
                                  //         ),
                                  //       ))
                                  // else
                                  //   // Container(),
                                  //   // PostBottomIcons(
                                  //   //   professionalId: professionalId,
                                  //   //   relates: const [],
                                  //   // ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
