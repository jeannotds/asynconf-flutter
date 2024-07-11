import 'package:asyncof/models/events_model.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  const EditEventPage({super.key, required this.event});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController confSpeakerNameController;
  late TextEditingController confNameController;
  late String confSelectedType;
  late String confAvatar;
  late DateTime confSelectedDate;

  @override
  void initState() {
    super.initState();
    confSpeakerNameController =
        TextEditingController(text: widget.event.speaker);
    confNameController = TextEditingController(text: widget.event.subject);
    confSelectedType = widget.event.type;
    confSelectedDate = (widget.event.timestamp).toDate();
    confAvatar = widget.event.avatar;
  }

  @override
  void dispose() {
    super.dispose();
    confSpeakerNameController.dispose();
    confNameController.dispose();
  }

  Future<void> _saveEvent() async {
    if (_formKey.currentState!.validate()) {
      // Mettre à jour les données de l'événement dans Firestore
      CollectionReference eventsRef =
          FirebaseFirestore.instance.collection("Events");
      await eventsRef
          .doc(widget.event.id) // Assurez-vous d'avoir l'ID du document
          .update({
        'subject': confNameController.text,
        'speaker': confSpeakerNameController.text,
        'avatar': confAvatar,
        'type': confSelectedType,
        'date': confSelectedDate,
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Modification de l'evenement"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Entrer nom de la conference",
                        labelText: "Nom conference",
                      ),
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
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Entrer nom du speakere",
                        labelText: "Nom du speaker",
                      ),
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
                    child: DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      items: const [
                        DropdownMenuItem(
                          value: "talk",
                          child: Text("Talk show"),
                        ),
                        DropdownMenuItem(
                          value: "demo",
                          child: Text("Demo show"),
                        ),
                        DropdownMenuItem(
                          value: "partner",
                          child: Text("Partner show"),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          confSelectedType = value!;
                        });
                      },
                      value: confSelectedType,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                          // labelText: 'Selectionner une date',
                          border: OutlineInputBorder()),
                      // initialPickerDateTime:  DateTime.now().add(const Duration(days: 20)),,
                      initialValue: confSelectedDate,
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
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3))))),
                        onPressed: () {
                          _saveEvent();
                        },
                        // },
                        child: const Text("Modifier")),
                  )
                ],
              )),
        ));
  }
}
