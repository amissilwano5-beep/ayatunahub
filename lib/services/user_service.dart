import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() : null;
    } catch (_) {
      return null;
    }
  }

  static Future<bool> isCurrentUserAdmin(User? user) async {
    if (user == null || user.email == null) return false;

    final snapshot = await _firestore.collection('users').doc(user.uid).get();
    if (!snapshot.exists) {
      return user.email!.trim().toLowerCase() == 'amissilwano5@gmail.com';
    }

    final role = snapshot.data()?['role'];
    return role == 'admin' || user.email!.trim().toLowerCase() == 'amissilwano5@gmail.com';
  }

  static Future<void> ensureUserProfile(User user) async {
    final docRef = _firestore.collection('users').doc(user.uid);
    final doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({
        'email': user.email,
        'role': 'user',
        'isSubscribed': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }
}
