import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';

class PaymentScreen extends StatefulWidget {
 // const PaymentScreen({.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardController = TextEditingController();
  TextEditingController CVVController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  void dispose() {
    cardController.dispose();
    CVVController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "Payment",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "montserrat"),
              ),
              const SizedBox(height: 20),
              const Text("Card details",
                  style: TextStyle(
                      color: Colors.black, fontSize: 13, fontFamily: "montserrat")),
              TextFieldWidget(
                  controller: cardController,
                  obscure: false,
                  hint: "Enter card details"),
              const SizedBox(height: 10),
              Row(children: const [
                Text("Exp. date",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'montserrat')),
                Text("CVV",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'montserrat'))
              ]),
              Row(
                children: [
                  TextFieldWidget(
                      controller: dateController, obscure: false, hint: "DD/MM"),
                  TextFieldWidget(
                      controller: CVVController, obscure: false, hint: "Enter CVV")
                ],
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              ClickButtons(onpressed: () { ScaffoldMessenger.of(context).showSnackBar(
                   const  SnackBar(
          backgroundColor:greenColor,
          duration:Duration(seconds:5),
          content: Text("Payment Not Available", style:TextStyle(color:Colors.white, fontFamily:"Montserrat"))
    ));}, text: "Pay now")
            ],
          ),
        ),
      ),
    );
  }
}
