import 'package:asyncof/models/events_model.dart';
import 'package:flutter/material.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  const EditEventPage({super.key, required this.event});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confSpeakerNameController = TextEditingController();
  final confNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    confSpeakerNameController.dispose();
    confNameController.dispose();
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
                          if (_formKey.currentState!.validate()) {
                            final speakerName = confSpeakerNameController.text;
                            final confName = confNameController.text;
                            print("speakerName : $speakerName");
                            print("confName : $confName");
                          }
                        },
                        child: const Text("Modifier")),
                  )
                ],
              )),
        ));
  }
}
