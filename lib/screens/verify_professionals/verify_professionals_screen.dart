import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/screens/verify_professionals/view_professional_details_screen.dart';

class VerifyProfessionalsScreen extends StatefulWidget {
  const VerifyProfessionalsScreen({super.key});

  @override
  State<VerifyProfessionalsScreen> createState() =>
      _VerifyProfessionalsScreenState();
}

class _VerifyProfessionalsScreenState extends State<VerifyProfessionalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Professionals")),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: layoutPadding,
                  left: layoutPadding,
                  right: layoutPadding,
                  bottom: 5),
              child: Text(
                "Professionals",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('professionals')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final professionals = snapshot.data?.docs;
                      return SizedBox(
                          height: 750,
                          child: ListView.builder(
                              itemCount: professionals?.length,
                              itemBuilder: (context, index) {
                                final professional = professionals![index];
                                final professionalId = professional.id;
                                final bool isVerified =
                                    professional['isVerified'];
                                final String phoneNumber =
                                    professional['phoneNumber'];
                                final String userName =
                                    professional['userName'];
                                final String email = professional['email'];

                                return SizedBox(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: layoutPadding,
                                          right: layoutPadding,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ViewProfessionalDetailsScreen(
                                                                professionalId:
                                                                    professionalId,
                                                                userName:
                                                                    userName,
                                                                email: email,
                                                                isVerified:
                                                                    isVerified,
                                                              )));
                                                },
                                                child: SizedBox(
                                                    width: 350,
                                                    child: Card(
                                                      elevation: 10,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Container(
                                                        // decoration:
                                                        //     const BoxDecoration(
                                                        //   border: Border(
                                                        //     bottom: BorderSide(
                                                        //       color: Colors.teal,
                                                        //       width: 1.0,
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top:
                                                              layoutPadding + 5,
                                                          bottom:
                                                              layoutPadding + 5,
                                                          left: layoutPadding,
                                                          right: layoutPadding,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  userName,
                                                                  maxLines: 3,
                                                                  textWidthBasis:
                                                                      TextWidthBasis
                                                                          .parent,
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Text(
                                                              email,
                                                              softWrap: true,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          14.5),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            isVerified
                                                                ? Text(
                                                                    "Verified",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      color:
                                                                          primaryColor,
                                                                      fontSize:
                                                                          14.5,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              )
                                                                : Text(
                                                                    "Not Verified",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      color:
                                                                          Colors.red,
                                                                      fontSize:
                                                                          14.5,
fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ])));
                              }));
                    }
                  },
                )),
          ],
        ))));
  }
}
