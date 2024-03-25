// ignore_for_file: unused_import

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signin/menu.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  late TextEditingController _nameController;
  File? _imageFile;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: FirebaseAuth.instance.currentUser?.displayName ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

    Future<void> _uploadImageToFirebase() async {
    if (_imageFile == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final firebaseStorageRef = FirebaseStorage.instance.ref().child('profile_images').child(FirebaseAuth.instance.currentUser!.uid + '.jpg');
      await firebaseStorageRef.putFile(_imageFile!);
      final imageUrl = await firebaseStorageRef.getDownloadURL();

      await FirebaseAuth.instance.currentUser?.updatePhotoURL(imageUrl);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile photo updated successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile photo: $error')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: _selectImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : FirebaseAuth.instance.currentUser?.photoURL != null ? NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!) as ImageProvider<Object>? : null,
                child: _isUploading
                ? CircularProgressIndicator()
                 : _imageFile == null && FirebaseAuth.instance.currentUser?.photoURL == null
                        ? Icon(Icons.person, size: 50, color: Colors.grey)
                        : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImageToFirebase,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
