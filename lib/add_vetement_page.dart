import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:othmane_bouhanib/reusable_widgets/reusable_widget.dart';
import 'package:othmane_bouhanib/utils/color_utils.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titreController = TextEditingController();
  final tailleController = TextEditingController();
  final marqueController = TextEditingController();
  final prixController = TextEditingController();
  final imageController = TextEditingController();
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Ajouter Vêtement'),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Titre :", Icons.calendar_view_day, false, titreController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Taille :", Icons.format_size, false, tailleController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Marque :", Icons.ac_unit_rounded, false, marqueController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Prix € :", Icons.price_change_outlined, false, prixController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      "Image :", Icons.image, false, imageController),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownMultiSelect(
                    onChanged: (List<String> x) {
                      setState(() {
                        categories = x;
                      });
                    },
                    options: const [
                      'Eté',
                      'Printemps',
                      'Automne',
                      'Hiver',
                    ],
                    selectedValues: categories,
                    whenEmpty: 'Select Something',
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance.collection('Vêtements').add({
                          'titre': titreController.value.text,
                          'taille': tailleController.value.text,
                          'marque': marqueController.value.text,
                          'prix': prixController.value.text,
                          'image': imageController.value.text,
                          'categories': categories,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Ajouter'))
                ]),
              ),
            )));
  }
}
