import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para registrar um usuário com e-mail e senha
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Erro no cadastro: $e");
      return null;
    }
  }

  // Método para login com e-mail e senha
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Erro no login: $e");
      return null;
    }
  }

  // Método para logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Método para obter o usuário atual
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
