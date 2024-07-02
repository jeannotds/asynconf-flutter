import 'package:flutter/material.dart';

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
                      final name = confNameController.text;
                      final speaker = confSpeakerNameController.text;
                      final typeConf = confSelectedType;

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envois en cours...")));

                      // Send form and close keyboard
                      FocusScope.of(context).requestFocus(FocusNode());
                      print("confNameController : $name");
                      print("confNameController : $speaker");
                      print("Type de conference : $typeConf");
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
