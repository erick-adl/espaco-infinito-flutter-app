import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Therapy extends ChangeNotifier {
  Therapy(
      {this.id,
      this.name,
      this.description,
      this.brief,
      this.images,
      this.deleted = false}) {
    images = images ?? [];
  }

  String id;
  String name;
  String brief;
  String description;
  List<String> images;
  bool deleted;

  Therapy.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document['name'] as String;
    brief = document['brief'] as String;
    description = document['description'] as String;
    images = List<String>.from(document.data['images'] as List<dynamic>);
    deleted = (document.data['deleted'] ?? false) as bool;
  }

  final Firestore firestore = Firestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  DocumentReference get firestoreRef => firestore.document('therapies/$id');
  StorageReference get storageRef => storage.ref().child('therapies').child(id);

  List<dynamic> newImages;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> save() async {
    loading = true;

    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'brief': brief,
      'deleted': deleted
    };

    if (id == null) {
      final doc = await firestore.collection('therapies').add(data);
      id = doc.documentID;
    } else {
      await firestoreRef.updateData(data);
    }

    final List<String> updateImages = [];

    for (final newImage in newImages) {
      if (images.contains(newImage)) {
        updateImages.add(newImage as String);
      } else {
        final StorageUploadTask task =
            storageRef.child(Uuid().v1()).putFile(newImage as File);
        final StorageTaskSnapshot snapshot = await task.onComplete;
        final String url = await snapshot.ref.getDownloadURL() as String;
        updateImages.add(url);
      }
    }

    for (final image in images) {
      if (!newImages.contains(image) && image.contains('firebase')) {
        try {
          final ref = await storage.getReferenceFromUrl(image);
          await ref.delete();
        } catch (e) {
          debugPrint('Falha ao deletar $image');
        }
      }
    }

    await firestoreRef.updateData({'images': updateImages});

    images = updateImages;

    loading = false;
  }

  void delete() {
    firestoreRef.updateData({'deleted': true});
  }

  Therapy clone() {
    return Therapy(
      id: id,
      name: name,
      description: description,
      brief: brief,
      images: List.from(images),
      deleted: deleted,
    );
  }
}
