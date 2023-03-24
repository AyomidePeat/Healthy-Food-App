import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/create_account_screen.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/repositories/auth_repo.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/loading_button.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textButton.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';
import 'package:healthfooddelivery/widgets/underlined_textbutton.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose;
    emailController.dispose;
    super.dispose();
  }

  var authHandler = AuthenticationMethods();
  Firestore firebaseFirestore = Firestore();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: size.width * 0.7),
                    const UnderlinedTextButton(
                      text: "Skip,",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Login to your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'montserrat',
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Good to see you again, enter your details\nbelow to continue ordering.",
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: "montserrat"),
                  ),
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 10),
                    ),
                  ),
                ]),
                const SizedBox(height: 7),
                TextFieldWidget(
                    controller: emailController,
                    obscure: false,
                    hint: 'Enter email'),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Montserrat",
                          fontSize: 10),
                    ),
                  ),
                ]),
                const SizedBox(height: 7),
                TextFieldWidget(
                    controller: passwordController,
                    obscure: true,
                    hint: 'Enter password'),
                SizedBox(height: size.height * 0.2),
                Row(
                  children: const [
                    //Icon(Icons.google),
                    SizedBox(width: 3),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingButton(
                        child: isLoading
                            ? const Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child:
                                      CircularProgressIndicator(color: Colors.white),
                                ),
                              )
                            : Text("Login to my account"),
                        onpressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(const Duration(seconds: 1));
                          String output = await authHandler.signIn(
                              email: emailController.text,
                              password: passwordController.text);
          
                          if (output == "Success") {
                            UserDetailsModel userdetails =
                                await firebaseFirestore.getUserName();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            setState(() {
                            isLoading = false;
                          });
                            const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: CircularProgressIndicator(color: Colors.white),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: greenColor,
                                content: Text(output,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16))));
                          }
                        },
                      ),
                      // isLoading
                      //     ? Center(
                      //         child: Column(children: const[
                      //         SizedBox(height: 10),
                      //         CircularProgressIndicator(color: greenColor)
                      //       ]))
                      //  : Container(),
                      const SizedBox(height: 10),
                      TextButtons(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccountScreen()));
                          },
                          text: "Create an account"),
                    ],
                  ),
                ),
              ],
            ),
                ),
              ),
          ),
        ));
  }
}
