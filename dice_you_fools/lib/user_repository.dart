import 'package:meta/meta.dart';
import 'package:dice_you_fools/Model/User.dart';
import 'package:amazon_cognito_identity_dart/cognito.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {


  ConnectionType _connectionType = ConnectionType.nothing;
  //CognitoUserPool _userPool;
  CognitoUser _cognitoUser;
  CognitoUserSession _session;
  CognitoCredentials credentials;
  CognitoUser _currentUser;

  String get userName {
    return _currentUser?.getUsername();
  }



  String get uid {
    return "_currentUser?.uid";
  }

  _reset(){
    _currentUser = null;
    _connectionType = ConnectionType.nothing;
  }

  Future<String> signInWithApple() async{
    print("SignInWithApple");
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:

      // Store user ID
        await FlutterSecureStorage()
            .write(key: "userId", value: result.credential.user);
        return "token";
        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error.localizedDescription}");
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }
    return null;
  }

  Future<String> signUp({@required String email, @required String password,}) async {
    final userPool = new CognitoUserPool(
        'us-east-1_vlikgVjot', '6tthsuuoeuvt9h35cvv49enng2');
    final userAttributes = [
      new AttributeArg(name: 'name', value: "Romain"),
      new AttributeArg(name: 'phone_number', value: "+33601734665"),
    ];
    print("SignUp USER REPO");
    var data;
    try {
      data = await userPool.signUp(email, password,userAttributes: userAttributes);
      print("DATA ======> " + data);
    } on CognitoUserConfirmationNecessaryException catch (e) {
      print("confirmation necessaire !!!!!");
    }
    catch (e) {
      print("ERROR : ");
      print(e);
      return "error";
    }
    return 'token';
  }

  Future<String> smsValidation({@required String email, @required String code}) async {
    final userPool = new CognitoUserPool(
        'us-east-1_vlikgVjot', '6tthsuuoeuvt9h35cvv49enng2');

    final cognitoUser = new CognitoUser(
        email, userPool, storage: userPool.storage);

    bool registrationConfirmed = false;
    try {
      registrationConfirmed = await cognitoUser.confirmRegistration(code);
    } catch (e) {
      print(e);
    }
    print(registrationConfirmed);
  }


  Future<String> authenticate({@required String email, @required String password,}) async {
    final userPool = new CognitoUserPool(
        'us-east-1_vlikgVjot', '6tthsuuoeuvt9h35cvv49enng2');
    final cognitoUser = new CognitoUser(
        email, userPool);
    final authDetails = new AuthenticationDetails(
        username: email, password: password);
    try {
      this._session = await cognitoUser.authenticateUser(authDetails);

    } on CognitoUserNewPasswordRequiredException catch (e) {
      print("-------------------------------------------------");
      print("CognitoUserNewPasswordRequiredException"+ e.toString());
      bool passwordChanged = false;
      try {
        passwordChanged = await cognitoUser.changePassword(
            password, 'Rwjafc6884!');
      } catch (e) {
        print(e);
      }
      print(passwordChanged);
      print("-------------------------------------------------");
      // handle New Password challenge
    } on CognitoUserMfaRequiredException catch (e) {
      print("CognitoUserMfaRequiredException"+ e.toString());
      // handle SMS_MFA challenge
    } on CognitoUserSelectMfaTypeException catch (e) {
      print("CognitoUserSelectMfaTypeException"+ e.toString());
      // handle SELECT_MFA_TYPE challenge
    } on CognitoUserMfaSetupException catch (e) {
      print("CognitoUserMfaSetupException"+ e.toString());
      // handle MFA_SETUP challenge
    } on CognitoUserTotpRequiredException catch (e) {
      print("CognitoUserTotpRequiredException"+ e.toString());
      // handle SOFTWARE_TOKEN_MFA challenge
    } on CognitoUserCustomChallengeException catch (e) {
      print("CognitoUserCustomChallengeException"+ e.toString());
      // handle CUSTOM_CHALLENGE challenge
    } on CognitoUserConfirmationNecessaryException catch (e) {
      print("CognitoUserConfirmationNecessaryException"+ e.toString());
      // handle User Confirmation Necessary
    } catch (e) {
      print("Auth error"+ e.toString());
    }
    //print(session.getAccessToken().getJwtToken());
    print("SESSION : " + this._session.getAccessToken().getJwtToken());
    return 'token';
  }



  _succeedConnection(CognitoUser user, ConnectionType connectionType){
    _connectionType = connectionType;
    _currentUser = user;
    handleFirstConnection(user.getUsername());
  }

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
  model, nothing
}
