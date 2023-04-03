import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/model/favorite_model.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen();

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Firestore firestore = Firestore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
               Navigator.pop(context,
                       );
                
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        title: const Text("Your Favourites",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            
            const SizedBox(height: 18),
            Expanded(
              child: StreamBuilder<List<Favourite>>(
                stream:firestore.getFavourites(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Favourite>> snapshot) {
                  if (snapshot.hasData) {
                    final fav = snapshot.data;
                    // cartItems = cart;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: fav.length,
                        itemBuilder: (context, index) {
                          Favourite favourite = fav[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title:Text(favourite.food),
                              leading: Image.network(favourite.imageUrl),
                              onTap: () {},
                            ),
                          );
                        });
                  } else {
                    String error = snapshot.error;
                    print(error);
                    return Center(
                      child: CircularProgressIndicator(color: greenColor),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
