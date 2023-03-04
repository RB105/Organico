import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'wishList');
              },
              leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffE9F0F7),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(Icons.favorite),
                      ),
                    ),
              title: const Text('Wish List'),
              trailing:  const Icon(Icons.arrow_forward_ios_rounded),
            ),
             ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'settings');
              },
              leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffE9F0F7),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(Icons.settings),
                      ),
                    ),
              title: const Text('Settings'),
              trailing:  const Icon(Icons.arrow_forward_ios_rounded),
             ),
             ListTile(
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
              },
              leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffE9F0F7),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(Icons.exit_to_app),
                      ),
                    ),
              title: const Text('Log out'),
              trailing:  const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
