import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getCurrentToken() async {
    return _auth.currentUser?.getIdTokenResult(false);
  }
}
