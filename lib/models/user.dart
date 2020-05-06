import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  FirebaseUser _firebaseUser;
  bool _isFirstVisit;


  bool get isFirstVisit => _isFirstVisit;

  set isFirstVisit(bool value) {
    _isFirstVisit = value;
  }

  FirebaseUser get firebaseUser => _firebaseUser;


  void setUser(FirebaseUser user) {
    _firebaseUser = user;
    notifyListeners();
  }

  User(this._firebaseUser);
}
