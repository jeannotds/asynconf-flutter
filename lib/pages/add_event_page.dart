import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  //garder le status du formulaire avec toutes les informations
  final _formKey = GlobalKey<FormState>();

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
                      print("Vey good");
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envois en cours...")));

                      // Send form and close keyboard
                      FocusScope.of(context).requestFocus(FocusNode());
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
