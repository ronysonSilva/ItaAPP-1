import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  FirebaseAuth _firabaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String nome,
    required String senha,
    required String email,
  }) async {
    try {
      UserCredential userCredential =
          await _firabaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "O usúario já está cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuarios(
      {required String email, required String senha}) async {
    try {
      await _firabaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogar() async {
    return _firabaseAuth.signOut();
  }
}
