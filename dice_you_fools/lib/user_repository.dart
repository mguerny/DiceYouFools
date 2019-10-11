import 'package:meta/meta.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserRepository {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ConnectionType _connectionType = ConnectionType.nothing;
  FirebaseUser _currentUser;


  String get uid {
    return _currentUser?.uid;
  }

  DocumentReference get userData {
    return Firestore.instance.collection("user").document(_currentUser?.uid);
  }

  _reset(){
    _currentUser = null;
    _connectionType = ConnectionType.nothing;
  }

  Future<String> authenticate({@required String username, @required String password,}) async {
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(email: username, password: password);
    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    if (user != null){
      _succeedConnection(user, ConnectionType.model);
    }
    print('signInEmail succeeded: $user');
    //Firestore.instance.collection("user").
    return 'token';
  }

  Future<String> authenticateWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    assert(user.uid != null);
    if (user != null){
      _succeedConnection(user, ConnectionType.google);
    }
    return 'token';
  }

  _succeedConnection(FirebaseUser user, ConnectionType connectionType){
    _connectionType = connectionType;
    _currentUser = user;
    handleFirstConnection(user.uid);
  }

  Future handleFirstConnection(String uid) async {
    CollectionReference users = Firestore.instance.collection("user");
    Map<String, dynamic> data =  Map<String, dynamic>();
    List<String> pictures = List<String>();
    data["pictures"] = pictures;

    DocumentSnapshot result = await users.document(uid).get();
    if (!result.exists){
      users.document(uid).setData(data);
    }
  }

  void addPictureUrl(String url){
      this.userData.updateData({"pictures": FieldValue.arrayUnion([url])});
  }

  String profilePicUrl() {
    /// Check if user != null before continuing
    return _currentUser?.photoUrl;
  }

  Future<bool> isLoggedIn() async {
    var user = _auth.currentUser();

    print(user.toString());
    if (user != null){
      print(user.toString());
      return true;
    }
    return false;
  }


  Future<void> logOut() async{

    switch(_connectionType){
      case ConnectionType.google:{ _googleSignIn.disconnect();}
      break;
      case ConnectionType.model:{ _auth.signOut();}
      break;
      case ConnectionType.nothing: {}
      break;
      default: {
        _reset();
      }
    }
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> deleteToken() async {

   /* print("in delete token");
    _googleSignIn.disconnect();
    _auth.signOut();
    await Future.delayed(Duration(seconds: 1));
    return;*/
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    ///

    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}

enum ConnectionType {
  google, model, nothing
}
