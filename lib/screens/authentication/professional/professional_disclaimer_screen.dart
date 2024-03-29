import 'package:flutter/material.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:relate_admin/constants/text_string.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/screens/authentication/professional/signup_as_professional_screen.dart';

class ProfessionalDisclaimerScreen extends StatefulWidget {
  const ProfessionalDisclaimerScreen({super.key});

  @override
  State<ProfessionalDisclaimerScreen> createState() =>
      _ProfessionalDisclaimerScreenState();
}

class _ProfessionalDisclaimerScreenState
    extends State<ProfessionalDisclaimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(layoutPadding),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Disclaimer".toUpperCase(),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800, fontSize: 20)),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tProfessionalDisclaimer, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tDisclaimer1, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tDisclaimer2, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tDisclaimer3, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tDisclaimer4, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  Text(tDisclaimer5, style: GoogleFonts.poppins()),
                  const SizedBox(
                    height: elementSpacing,
                  ),
                  SizedBox(
                    height: tButtonHeight,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignupAsProfessionalScreen();
                          },
                        ));
                      },
                      child: Text(
                        tIUnderstand.toUpperCase(),
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )))),
    );
  }
}
