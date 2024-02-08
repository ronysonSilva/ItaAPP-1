import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meu_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final Function() onLogout;
  final void Function(User? user, File? userImage) onUpdate;
  final String userName;
  final String userEmail;
  final String userImageURL;

  ProfilePage({
    required this.onLogout,
    required this.onUpdate,
    required this.userName,
    required this.userEmail,
    required this.userImageURL,
    required profile,
  });

  get userImage => null;

  @override
  _ProfilePageState createState() => _ProfilePageState();

  loadUserImage() {}
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _user;
  File? _userImage;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUser();
    _loadUserImage();
    _nameController.text = widget.userName;
  }

  Future<void> _fetchUser() async {
    _user = _auth.currentUser;
    setState(() async {
      if (_user?.photoURL != null) {
        try {
          // Primeiro, tentamos carregar a imagem do Firebase Storage
          String downloadURL = await firebase_storage.FirebaseStorage.instance
              .ref('profile_images/${_user!.uid}.jpg')
              .getDownloadURL();

          setState(() {
            _userImage = File(downloadURL);
          });

          // Salva a imagem localmente para evitar carregamentos repetidos do Storage
          await _saveUserImage();
        } catch (e) {
          // Se ocorrer um erro ao buscar no Firebase Storage, tentamos carregar localmente
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? imagePath = prefs.getString('userImage');

          if (imagePath != null) {
            setState(() {
              _userImage = File(imagePath);
            });
          } else {
            print('Error fetching image from Firebase Storage: $e');
          }
        }
      }
    });
  }

  Future<void> _loadUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('userImage');

    if (imagePath != null) {
      setState(() {
        _userImage = File(imagePath);
      });
    }
  }

  Future<void> _clearUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userImage');
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _userImage = File(pickedFile.path);
      _saveUserImage();
      widget.onUpdate(_user, _userImage);
      await _uploadImageToStorage();
      _updateUserPhotoURL();
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _userImage = File(pickedFile.path);
      _saveUserImage();
      widget.onUpdate(_user, _userImage);
      await _uploadImageToStorage();
      _updateUserPhotoURL();
    }
  }

  Future<void> _saveUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userImage != null) {
      prefs.setString('userImage', _userImage!.path);
    }
  }

  Future<void> _uploadImageToStorage() async {
    try {
      if (_user != null && _userImage != null) {
        String uid = _user!.uid;
        String fileName = 'profile_images/$uid.jpg';

        firebase_storage.Reference storageReference =
            firebase_storage.FirebaseStorage.instance.ref().child(fileName);

        await storageReference.putFile(_userImage!);
        print('Image uploaded successfully!');
      }
    } catch (e, stackTrace) {
      print("Error uploading image to storage: $e");
      print(stackTrace); // Agora podemos acessar o stackTrace diretamente.
    }
  }

  void _updateUserPhotoURL() async {
    try {
      if (_user != null) {
        await _user!.updatePhotoURL(_userImage!.path);
        _fetchUser();
      }
    } catch (e) {
      print("Error updating user photo URL: $e");
    }
  }

  void _editUserName() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Color.fromARGB(255, 0, 55, 104), // Cor de fundo do AlertDialog
          title: Text(
            'Editar Nome',
            style: SafeGoogleFont(
              'Inter',
              fontSize: 15.6911201477,
              fontWeight: FontWeight.w500,
              height: 1.2125,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          content: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Novo Nome',
              labelStyle:
                  TextStyle(color: Colors.white), // Cor do texto do rótulo
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 15.6911201477,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _updateUserName();
                Navigator.pop(context);
              },
              child: Text(
                'Salvar',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 15.6911201477,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _updateUserName() async {
    try {
      if (_user != null) {
        await _user!.updateDisplayName(_nameController.text);
        _fetchUser();
      }
    } catch (e) {
      print("Error updating user name: $e");
    }
  }

  String _generateAvatarText() {
    String initials = 'AA';

    if (_user?.displayName != null && _user!.displayName!.isNotEmpty) {
      List<String> nameParts = _user!.displayName!.split(' ');
      if (nameParts.isNotEmpty) {
        initials = '';
        for (var part in nameParts) {
          initials += part.characters.first.toUpperCase();
        }
      }
    }

    return initials;
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Escolher da galeria"),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("Tirar uma foto"),
              onTap: () {
                Navigator.pop(context);
                _takePhoto();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(33.06, 0, 0, 36.55),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.487, -1.117),
            end: Alignment(0.931, 1.045),
            colors: <Color>[Color(0xff00427d), Color(0xff003768)],
            stops: <double>[0, 1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _showImageOptions,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      _userImage != null ? FileImage(_userImage!) : null,
                  child: _userImage == null
                      ? Text(
                          _generateAvatarText(),
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Text(
                _user?.displayName ?? '',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 10),
              Text(
                _user?.email ?? '',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 15.6911201477,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: _editUserName,
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.white), // Icon à esquerda
                    SizedBox(width: 10), // Espaçamento entre o ícone e o texto
                    Text('Alterar Nome'), // Texto do botão
                  ],
                ),
              ),
              /*const Divider(
                thickness: 1,
                indent: 0,
                endIndent: 5,
                color: Colors.black,
              ),*/
              SizedBox(height: 200),
              TextButton(
                onPressed: () async {
                  await widget.onLogout();
                  //_clearUserImage();
                },
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 104, 104),
                  backgroundColor: Colors.transparent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app_outlined,
                        color: Colors.white), // Icon à esquerda
                    SizedBox(width: 10), // Espaçamento entre o ícone e o texto
                    Text('Sair'), // Texto do botão
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
