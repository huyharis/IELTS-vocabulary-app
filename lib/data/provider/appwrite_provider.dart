import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ielts_vocabulary_app/constants/appwrite_constant.dart';

class AppwriteClientProvider {
  Client client = Client();
  Account? account;
  Databases? databases;

  AppwriteClientProvider() {
    client
        .setEndpoint(AppWriteConstant.endPoint)
        .setProject(AppWriteConstant.projectId)
        .setSelfSigned(status: true);
    account = Account(client);
    databases = Databases(client);
  }

  Future<models.User> signUp(Map map) async {
    final response = account!.create(
      userId: map["userId"],
      email: map["email"],
      password: map["password"],
    );
    return response;
  }

  Future<models.Session> signIn(Map map) async {
    final response = account!.createEmailSession(
      email: map["email"],
      password: map["password"],
    );
    return response;
  }

  Future<models.DocumentList> getTopics() async {
    final response = databases!.listDocuments(
        databaseId: AppWriteConstant.dbId,
        collectionId: AppWriteConstant.collectionId);
    return response;
  }

  Future<models.User?> loginWithGoogle() async {
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null; // Sign-in canceled
      }
      final result = await account?.createOAuth2Session(
        provider: 'google',
      );

      return result.user;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }
}
