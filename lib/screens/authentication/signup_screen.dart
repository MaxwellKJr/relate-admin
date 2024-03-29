import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relate_admin/components/auth_text_field.dart';
import 'package:relate_admin/constants/colors.dart';
import 'package:relate_admin/constants/size_values.dart';
import 'package:relate_admin/constants/text_string.dart';
import 'package:relate_admin/screens/authentication/login_screen.dart';
import 'package:relate_admin/screens/authentication/professional/professional_disclaimer_screen.dart';
import 'package:relate_admin/screens/authentication/professional/signup_as_professional_screen.dart';
import 'package:relate_admin/services/auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Auth auth = Auth();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _groupsController = TextEditingController();

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();

  bool _isLoading = false;

  void onButtonPressed() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(layoutPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        tCreateAccount,
                        style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: primaryColor),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: elementSpacing),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              AuthTextField(
                                controller: _userNameController,
                                hintText: tUserName,
                                obscureText: false,
                                prefixIcon: const Icon(Icons.person),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                focusNode: _focusNode1,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode2),
                              ),
                              const SizedBox(height: elementSpacing),
                              AuthTextField(
                                controller: _emailController,
                                hintText: tEmail,
                                obscureText: false,
                                prefixIcon: const Icon(Icons.alternate_email),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                focusNode: _focusNode2,
                                onFieldSubmitted: (value) =>
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode3),
                              ),
                              const SizedBox(height: elementSpacing),
                              AuthTextField(
                                controller: _passwordController,
                                hintText: tPassword,
                                obscureText: true,
                                prefixIcon: const Icon(Icons.lock),
                                textInputAction: TextInputAction.send,
                                keyboardType: TextInputType.visiblePassword,
                                focusNode: _focusNode3,
                                onFieldSubmitted: (value) => auth.signUp(
                                  context,
                                  _userNameController,
                                  _phoneNumberController,
                                  _emailController,
                                  _passwordController,
                                  _groupsController,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          SizedBox(
                            height: tButtonHeight,
                            width: _isLoading ? tButtonHeight : double.infinity,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : FilledButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        onButtonPressed();
                                        _focusNode1.unfocus();
                                        _focusNode2.unfocus();
                                        _focusNode3.unfocus();
                                        auth.signUp(
                                          context,
                                          _userNameController,
                                          _phoneNumberController,
                                          _emailController,
                                          _passwordController,
                                          _groupsController,
                                        );
                                      }
                                    },
                                    child: Text(
                                      tSignupText.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: elementSpacing),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    tAlreadyHaveAnAccount,
                                    style: GoogleFonts.poppins(),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const LoginScreen()));
                                      },
                                      child: const Text(
                                        tLogin,
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                              const SizedBox(height: elementSpacing),
                              const Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(height: elementSpacing),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    const ProfessionalDisclaimerScreen()));
                                      },
                                      child: const Text(
                                        tCreateProfessionalAccount,
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
        ))));
  }
}
