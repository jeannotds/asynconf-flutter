import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> createEvent(context, event) async {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Envois en cours...")));

  // Send form and close keyboard
  FocusScope.of(context).requestFocus(FocusNode());

  // Recuperer la collection
  CollectionReference eventsRef =
      FirebaseFirestore.instance.collection("Events");

  await eventsRef.add({
    "speaker": event["speakerName"],
    "date": event["dateConf"],
    "subject": event["confName"],
    "avatar": event["avatar"],
    "type": event["typeConf"]
  });
}
