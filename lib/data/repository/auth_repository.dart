import 'package:appwrite/models.dart';
import 'package:ielts_vocabulary_app/data/provider/appwrite_provider.dart';

class AuthRepository{
  final AppwriteClientProvider appwriteClientProvider;
  AuthRepository(this.appwriteClientProvider);

  Future<User> signUp(Map map) => appwriteClientProvider.signUp(map);
  Future<Session> signIn(Map map) => appwriteClientProvider.signIn(map);
  Future<DocumentList> getTopics() => appwriteClientProvider.getTopics();
  Future<User?> loginWithGoogle() => appwriteClientProvider.loginWithGoogle();
}