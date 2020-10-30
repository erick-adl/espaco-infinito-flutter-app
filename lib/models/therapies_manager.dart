import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infinito/models/therapy.dart';

class TherapiesManager extends ChangeNotifier {
  TherapiesManager() {
    _loadTherapiesList();
  }
  final Firestore firestore = Firestore.instance;

  List<Therapy> therapiesList = [];

  String _search = '';

  String get search => _search;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  List<Therapy> get filteredTherapies {
    final List<Therapy> filteredTherapies = [];

    if (search.isEmpty) {
      filteredTherapies.addAll(therapiesList);
    } else {
      filteredTherapies.addAll(therapiesList
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredTherapies;
  }

  Future<void> _loadTherapiesList() async {
    final snapshot = await firestore
        .collection('therapies')
        .where('deleted', isEqualTo: false)
        .getDocuments();

    therapiesList =
        snapshot.documents.map((e) => Therapy.fromDocument(e)).toList();

    notifyListeners();
  }

  Therapy findTherapyById(String id) {
    try {
      return therapiesList.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  void update(Therapy therapy) {
    therapiesList.removeWhere((p) => p.id == therapy.id);
    therapiesList.add(therapy);
    notifyListeners();
  }

  void delete(Therapy therapy) {
    therapy.delete();
    therapiesList.removeWhere((p) => p.id == therapy.id);
    notifyListeners();
  }
}
