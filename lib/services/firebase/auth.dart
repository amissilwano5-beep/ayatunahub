import 'package:firebase_auth/firebase_auth.dart';

class AppAuth {
  AppAuth._();

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static const String adminEmail = 'amissilwano5@gmail.com';

  static User? get currentUser => firebaseAuth.currentUser;

  static Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  static bool isAdmin(User? user) {
    final email = user?.email?.trim().toLowerCase();
    return email == adminEmail.toLowerCase();
  }

  static bool get isCurrentUserAdmin => isAdmin(currentUser);

  static Future<User?> signInWithEmailPassword(String email, String password) async {
    final cleanedEmail = email.trim();
    final cleanedPassword = password.trim();

    if (cleanedEmail.isEmpty || cleanedPassword.isEmpty) {
      return null;
    }

    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: cleanedEmail,
        password: cleanedPassword,
      );
      return credential.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  static Future<User?> createUserWithEmailPassword(
    String email,
    String password,
  ) async {
    final cleanedEmail = email.trim();
    final cleanedPassword = password.trim();

    if (cleanedEmail.isEmpty || cleanedPassword.isEmpty) {
      return null;
    }

    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: cleanedEmail,
        password: cleanedPassword,
      );
      return credential.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
