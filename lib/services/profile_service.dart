import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hs_frontend/services/session_manager.dart';
import 'package:hs_frontend/utils/utils.dart';
import 'package:hs_frontend/widgets/custom_text_form.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileService with ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final PickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (PickedFile != null) {
      _image = XFile(PickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final PickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (PickedFile != null) {
      _image = XFile(PickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.camera,
                    color: Colors.black26,
                  ),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.image,
                    color: Colors.black26,
                  ),
                  title: Text('Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadImage(BuildContext context) async {
    setLoading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionService().userId.toString());

    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);

    final newUrl = await storageRef.getDownloadURL();
    ref
        .child(SessionService().userId.toString())
        .update({'profile': newUrl.toString()}).then((value) {
      Utils.toastMessage('Profile updated successfully');
      setLoading(false);
      _image = null;
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      setLoading(false);
    });
  }

  Future<void> showUserNameDialogAlert(
    BuildContext context,
    String name,
  ) {
    nameController.text = name;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Update Username')),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField1(
                    hintText: 'Enter Name',
                    controller: nameController,
                    prefixIcon: Icons.person,
                    onValidator: (value) {
                      return null;
                    },
                    focusNode: nameFocusNode,
                    onFieldSubmittedValue: (value) {}),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.child(SessionService().userId.toString()).update(
                    {'username': nameController.text.toString()}).then((value) {
                  nameController.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Ok', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

  Future<void> showPhoneDialogAlert(BuildContext context, String phoneNumber) {
    phoneController.text = phoneNumber;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Update Phone Number')),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField1(
                    hintText: 'Enter Phone Number',
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    onValidator: (value) {
                      return null;
                    },
                    focusNode: phoneFocusNode,
                    onFieldSubmittedValue: (value) {}),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                ref.child(SessionService().userId.toString()).update(
                    {'phone': phoneController.text.toString()}).then((value) {
                  phoneController.clear();
                });
                Navigator.pop(context);
              },
              child: Text('Ok', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }
}
