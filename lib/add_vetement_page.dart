import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          child: Column(
            children: [

              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                title: Row(children: [
                  const Text(""),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ]),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(children: [
                  const Text('Titre :'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: titreController,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(children: [
                  const Text('Taille :'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: tailleController,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(children: [
                  const Text('Marque :'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: marqueController,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(children: [
                  const Text('Prix (Euro) :'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: prixController,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.white30, width: 1.5),
                ),
                title: Row(children: [
                  const Text('Image :'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: imageController,
                    ),
                  )
                ]),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
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
            ],
          ),
        ));
  }
}
