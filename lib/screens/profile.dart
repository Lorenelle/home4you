import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home4you/screens/login.dart';
import 'package:home4you/services/image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  static String id = 'profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;

  File? _image;
  String? imageLink;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
      String link = await ImageStorage().addProfileImage(_image);
      setState(() {
        imageLink = link;
      });
    }

//EDIT PROFILE BUTTON
    final editButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown,
        child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            // minWidth: MediaQuery.of(context).size.width,
            onPressed: () {},
            child: const Text(
              'Edit Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 34, 1, 1),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.brown,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Color.fromARGB(255, 109, 111, 114),
                      child: ClipOval(
                          child: SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "https://artscimedia.case.edu/wp-content/uploads/sites/79/2016/12/14205134/no-user-image.gif",
                                      fit: BoxFit.cover,
                                    ))),
                    ),
                  ),
                ],
              ),
              /*      Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    getImage();
                  },
                ),
              ),*/
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Container(
                  child: const Text(
                    'Loren Cisneros',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'Bio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
              ),
              editButton,
            ],
          ),
        ),
      ),
    );
  }
}
