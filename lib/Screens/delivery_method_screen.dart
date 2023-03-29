

import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/payment_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textButton.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';

class DeliveryMethodScreen extends StatefulWidget {
  //const DeliveryMethodScreen({.key});

  @override
  State<DeliveryMethodScreen> createState() => _DeliveryMethodScreenState();
}

class _DeliveryMethodScreenState extends State<DeliveryMethodScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void dispose() {
    phoneNumber.dispose();
    addressController.dispose();
    super.dispose();
  }

  String address = "137 Teatickect Hwy, East\n Falmouth MA 256";
  String phoneNo = "+234 9011039271";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
           automaticallyImplyLeading: false,
          centerTitle: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
          const Text(
            "Delivery method",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("$address"),
              TextButtons(
                onPressed: () {
                  TextFieldWidget(
                      controller: addressController,
                      obscure: false,
                      hint: "Phone Number ");
                  setState(() {
                    address = addressController.text;
                  });
                },
                text: "Change",
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text("$phoneNo"),
              TextButtons(
                onPressed: () {
                  TextFieldWidget(
                      controller: phoneNumber,
                      obscure: false,
                      hint: "Phone Number ");
                  setState(() {
                    phoneNo = phoneNumber.text;
                  });
                },
                text: "Change",
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "Payment",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: "Montserrat"),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                onPressed: () { ScaffoldMessenger.of(context).showSnackBar(
                 const  SnackBar(
        backgroundColor:greenColor,
        duration:Duration(seconds:5),
        content: Text("Other Payment Options are not Available", style:TextStyle(color:Colors.white, fontFamily:"Montserrat"))
    ));},
                icon: const Icon(Icons.add_circle_outline, color: greenColor)),
            Image.asset("images/stripe.png"),
            Image.asset("images/paypal.png"),
            Image.asset("images/mastercard.png"),
          ]),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.circle_outlined),
              ),
              const Text(
                "Pay on arrival",
                style: TextStyle(fontFamily: "montserrat"),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Pay with cash/POS upon arrival",
            style: TextStyle(
              color: greenColor,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Delivery Fee",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text("\$20"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "SubTotal",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text("\$520"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              Text(
                "#540",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClickButtons(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  PaymentScreen()));
              },
              text: "Proceed To Payment")
        ]),
      ),
    );
  }
}
