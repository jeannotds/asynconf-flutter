import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

createEvent(context, event) {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Envois en cours...")));

  // Send form and close keyboard
  FocusScope.of(context).requestFocus(FocusNode());

  // Recuperer la collection
  CollectionReference eventsRef =
      FirebaseFirestore.instance.collection("Events");

  eventsRef.add({
    "speaker": event["speakerName"],
    "date": event["dateConf"],
    "subject": event["confName"],
    "avatar": event["avatar"],
    "type": event["typeConf"]
  });
}
