import 'dart:io';

import 'package:asyncof/helpers/add_event.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  //garder le status du formulaire avec toutes les informations
  final _formKey = GlobalKey<FormState>();

  //get value Input
  final confNameController = TextEditingController();
  final confSpeakerNameController = TextEditingController();
  String confSelectedType = "talk";
  DateTime confSelectedDate = DateTime.now();
  String confAvatar = "";
  //  selectedDate;

//dispose elements to get
  @override
  void dispose() {
    super.dispose();
    confNameController.dispose();
    confSpeakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      // decoration: BoxDecoration(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Entrer nom de la conference",
                    labelText: "Nom conference",
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Tu dois completer ce texte';
                  } else {
                    return null;
                  }
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Entrer nom du speakere",
                    labelText: "Nom du speaker",
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Tu dois completer ce texte';
                  } else {
                    return null;
                  }
                },
                controller: confSpeakerNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: "talk", child: Text("Talk show")),
                    DropdownMenuItem(value: "demo", child: Text("Demo show")),
                    DropdownMenuItem(
                        value: "partner", child: Text("Partner show")),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      confSelectedType = value!;
                    });
                  },
                  value: confSelectedType),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                    labelText: 'Selectionner une date',
                    border: OutlineInputBorder()),
                initialPickerDateTime:
                    DateTime.now().add(const Duration(days: 20)),
                onChanged: (DateTime? value) {
                  setState(() {
                    confSelectedDate = value!;
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () async{

                    String imageUrl = "";
                    
                    // 1. Pick picture an image
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                  print("object : ${file?.path}");

                  if(file == null) return;

                  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                  print("uniqueFileName : $uniqueFileName");


                    // 2. Upload Image

                    // 2.1 Get the reference to storage root  : Obtenir la référence à la racine de stockage
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages = referenceRoot.child("images");

                    // handle error or success
                    try{
                    // 2.2 Create a reference for the image to stored : Créer une référence pour l'image à stocker
                    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
                   
                    // Store the file : Stocker le fichier
                    await referenceImageToUpload.putFile(File(file.path));

                    // if success : get download url
                    imageUrl = await referenceImageToUpload.getDownloadURL();

                     setState(() {
                      confAvatar = imageUrl;
                    });

                    print("imageUrl of image : $confAvatar");
                    // print("imageUrl of avatar : $confAvatar");


                    }catch(error){
                      print("Error occurred while uploading image: $error");
                    }




                    // 3. get Url
                    // 4. Storage image inside the corresponing documentation of the database
                    // 5.display de image
                  },
                  icon: const Icon(Icons.camera_alt)),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final event = {
                        'confName': confNameController.text,
                        'speakerName': confSpeakerNameController.text,
                        'typeConf': confSelectedType,
                        'avatar': confAvatar,
                        'dateConf': confSelectedDate,
                      };

                      createEvent(context, event);
                    }
                  },
                  child: const Text("Envoyer")),
            )
          ],
        ),
      ),
    );
  }
}
