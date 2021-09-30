import 'package:dartz/dartz.dart';
import 'package:supernova_sunburst/domain/auth/auth_failure.dart';
import 'package:supernova_sunburst/domain/auth/user.dart';
import 'package:supernova_sunburst/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
