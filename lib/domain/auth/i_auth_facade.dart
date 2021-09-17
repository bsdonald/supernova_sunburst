abstract class IAuthFacade {
  Future getSignedInUser();
  Future registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future signInWithGoogle();
  Future<void> signOut();
}
