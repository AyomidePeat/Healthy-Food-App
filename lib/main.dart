import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';import 'package:provider/provider.dart';

import 'firebase_options.dart';

 import 'package:healthfooddelivery/Screens/welcome_screen.dart';


  
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}
 



class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Colors.green,
          fontFamily: "Montserrat",
        ),
        home: WelcomeScreen());}}