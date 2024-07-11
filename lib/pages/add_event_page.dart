import 'package:asyncof/helpers/add_event.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

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
                        'avatar':
                            "https://res.cloudinary.com/disyacex9/image/upload/v1718372083/l4vfzow8qkjivno6nmsn.jpg",
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
