import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/services/firbase_auth_service.dart';
import 'package:e_commerce_app/core/services/firestore_service.dart';
import 'package:e_commerce_app/features/auth/data/auth_repo_impl.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

void setup() async {
  gitIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  gitIt.registerSingleton<DatabaseService>(FireStoreService());
  gitIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: gitIt<FirebaseAuthService>(),
      databaseService: gitIt<DatabaseService>(),
    ),
  );
}
