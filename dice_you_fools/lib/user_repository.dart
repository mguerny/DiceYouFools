import 'package:meta/meta.dart';

class UserRepository {


  ConnectionType _connectionType = ConnectionType.nothing;



  String get uid {
    return "_currentUser?.uid";
  }



  _reset(){
    //_currentUser = null;
    _connectionType = ConnectionType.nothing;
  }

  Future<String> authenticate({@required String username, @required String password,}) async {

    return 'token';
  }



  /*_succeedConnection(FirebaseUser user, ConnectionType connectionType){
    _connectionType = connectionType;
    _currentUser = user;
    handleFirstConnection(user.uid);
  }*/

  Future handleFirstConnection(String uid) async {
    /*CollectionReference users = Firestore.instance.collection("user");
    Map<String, dynamic> data =  Map<String, dynamic>();
    List<String> pictures = List<String>();
    data["pictures"] = pictures;

    DocumentSnapshot result = await users.document(uid).get();
    if (!result.exists){
      users.document(uid).setData(data);
    }*/
  }

  Future<bool> isLoggedIn() async {
    /*var user = _auth.currentUser();

    print(user.toString());
    if (user != null){
      print(user.toString());
      return true;
    }*/
    return false;
  }


  Future<void> logOut() async{

    /*switch(_connectionType){
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
    await Future.delayed(Duration(seconds: 1));*/
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
