import 'package:cloud_firestore/cloud_firestore.dart';

String checkImageUrl(QueryDocumentSnapshot<Object?> data) {
  Map<String, dynamic> doc = data.data() as Map<String, dynamic>;

  final String imageUrl = doc.containsKey('imageUrl') ? doc['imageUrl'] : '';
  return imageUrl;
}
