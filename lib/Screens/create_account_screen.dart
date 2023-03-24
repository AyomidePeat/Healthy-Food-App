import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/Screens/login_screen.dart';
import 'package:healthfooddelivery/repositories/auth_repo.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/loading_button.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textButton.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/widgets/underlined_textbutton.dart';

class CreateAccountScreen extends StatefulWidget {
  //const CreateAccountScreen({.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  AuthenticationMethods authHandler = AuthenticationMethods();
  Firestore nameHandler = Firestore();

  bool isLoading = false;
  @override
  void dispose() {
    passwordController.dispose;
    emailController.dispose;
    nameController.dispose;
    super.dispose();
  }
    

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(height: 15),
                  Padding(
                    padding:  const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Create an account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'montserrat',
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:  const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Welcome friend, enter your details so let's get\nstarted with ordering food",
                      //textAlign:TextAlign.center,
                      style:
                          TextStyle(color: Colors.black, fontFamily: "montserrat"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding:  const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 10),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    child: TextFieldWidget(
                        controller: nameController,
                        obscure: false,
                        hint: 'Enter your name'),
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Email Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 10),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    child: TextFieldWidget(
                        controller: emailController,
                        obscure: false,
                        hint: 'Enter email'),
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding:  const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 10),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 7),
                  SingleChildScrollView(
                    child: TextFieldWidget(
                        controller: passwordController,
                        obscure: true,
                        hint: 'Enter password'),
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Confirm Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 10),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 7),
                  TextFieldWidget(
                      controller: confirmPasswordController,
                      obscure: true,
                      hint: "Confirm password"),
                  SizedBox(height: size.height * 0.1),
                  Row(
                    children: const [
                      //Icon(Icons.google),
                      SizedBox(width: 3),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        : Text("Create an account"),
                           
                          onpressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                            String output = await authHandler.signUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text);
                           
                            if (passwordController.text == confirmPasswordController.text) {
                              if (output == "Success") {
                              
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: greenColor,
                                    content: Text("Account created successfully",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16))));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              } else {
                                  setState(() {
                              isLoading = false;
                            });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: greenColor,
                                    content: Text(output,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16))));
                              }
                            } 
                          },
                        ),

                        const SizedBox(height: 10),
                        TextButtons(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            text: "Login to my account"),
                      ],
                    ),
                  ),
                              ],
                            ),
                ))));
  }
}
