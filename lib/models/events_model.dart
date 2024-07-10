import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String subject;
  final String speaker;
  final String avatar;
  final String type;
  final Timestamp timestamp;

  Event({
    required this.id,
    required this.subject,
    required this.speaker,
    required this.avatar,
    required this.type,
    required this.timestamp,
  });

  // factory Event.fromData(dynamic data) {
  factory Event.fromData(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return Event(
        id: doc.id,
        subject: data["subject"],
        speaker: data["speaker"],
        avatar: data["avatar"].toString().toLowerCase(),
        type: data["type"],
        timestamp: data["date"]);
  }
}
