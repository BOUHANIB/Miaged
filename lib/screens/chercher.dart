import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:othmane_bouhanib/screens/home_screen.dart';
import 'package:othmane_bouhanib/screens/product.dart';
import 'package:othmane_bouhanib/screens/product_design_widget.dart';
import 'package:othmane_bouhanib/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';
import '../utils/color_utils.dart';

class ChercherPage extends StatefulWidget {
  const ChercherPage({Key? key}) : super(key: key);

  @override
  _ChercherPageState createState() => _ChercherPageState();
}

class _ChercherPageState extends State<ChercherPage> {
  
  Future<QuerySnapshot>? postDocumentsList;
  String userNameText ='';

  initSearchingPost(String textEntered)
  {
    postDocumentsList = FirebaseFirestore.instance.collection("Vêtements").
    where("titre",isEqualTo: textEntered).get();

    setState(() {
      postDocumentsList;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.centerRight, end: Alignment.centerLeft)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4")
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
          ),
          title:TextField(
            onChanged: (textEntered){
              setState(() {
                userNameText = textEntered;
              });
              initSearchingPost(textEntered);
            },
            decoration: InputDecoration(
              hintText: "Chercher un vêtement ....",
              hintStyle: const TextStyle(color:Colors.white54),
              border:InputBorder.none,
              suffixIcon:IconButton(
                icon: const Icon(Icons.search,color:Colors.white),
                onPressed: (){
                  initSearchingPost(userNameText);
                },
              ),
            ),
          ),
      ),

      body:
      /*Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.centerRight, end: Alignment.centerLeft)),

       */
      FutureBuilder<QuerySnapshot>(
        future: postDocumentsList,
        builder: (context,AsyncSnapshot snapshot)
        {
          return snapshot.hasData
          ?
              ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context , index)
              {
                Products model = Products.fromJson(
                  snapshot.data!.docs[index].data()! as Map<String , dynamic>
                );
                return ProductsDesignWidget(
                  model : model,
                  context: context,
                );
              }
              )
              :
              const Center(child: Text("No Record Exist"));
        }
      ),
    ),
    );
  }
}
