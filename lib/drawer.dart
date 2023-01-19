import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:othmane_bouhanib/screens/signin_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                  gradient:
                  LinearGradient(colors: [Colors.pinkAccent, Colors.purple])),
              child:
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/logo1.png"),
                      backgroundColor: Colors.transparent,
                      radius: 60,
                    ),
                  ),
          ),
          ListTile(
            title: const Text(
              'Mon Profil',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.home, color: Colors.purple),
            trailing: const Icon(Icons.arrow_right, color: Colors.purple),
            onTap: () {
              Navigator.pushNamed(context, "/profil");
            },
          ),

          const Divider(height: 8, color: Colors.purple),
          const Divider(height: 8, color: Colors.purple),

          ListTile(
            title: const Text(
              'Chercher',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.search, color: Colors.purple),
            trailing: const Icon(Icons.arrow_right, color: Colors.purple),
            onTap: () {
              Navigator.pushNamed(context, "/chercher");
            },
          ),
          /*const Divider(height: 8, color: Colors.purple),
          const Divider(height: 8, color: Colors.purple),
          ListTile(
            title: const Text(
              'Mon Panier',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.shopping_bag_outlined, color: Colors.purple),
            trailing: const Icon(Icons.arrow_right, color: Colors.purple),
            onTap: () {
              Navigator.pushNamed(context, "/panier");
            },
          ),

           */
          const Divider(height: 8, color: Colors.purple),
          const Divider(height: 8, color: Colors.purple),
          ListTile(
            title: const Text(
              'Liste de vêtements',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.shopping_bag_rounded, color: Colors.purple),
            trailing: const Icon(Icons.arrow_right, color: Colors.purple),
            onTap: () {
              Navigator.pushNamed(context, "/liste_vetement");
            },
          ),
          const Divider(height: 8, color: Colors.purple),
          const Divider(height: 8, color: Colors.purple),

          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(Icons.face_retouching_off, color: Colors.purple),
            trailing: const Icon(Icons.arrow_right, color: Colors.purple),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
          ),
          const Divider(height: 8, color: Colors.purple),
        ],
      ),
    );
  }
}
