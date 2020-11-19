import 'dart:convert';

import 'package:formvalidation/src/user-prefs/user-prefs.dart';
import 'package:http/http.dart' as http;



class UsuarioProvider {

  final String _firebaseToken = 'AIzaSyANWM7l1sHBdqw_h6tjkmwd-oqHNg9pOsQ';
  final _prefs = new UserPrefs();

  Future<Map<String, dynamic>>login( String email, String password) async {

    final authData = {
      'email'     : email,
      'password'  : password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodedResp = json.decode( resp.body );
    print(decodedResp);

    if ( decodedResp.containsKey('idToken') ) {

      _prefs.token = decodedResp['idToken'];

      return { 'ok':true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok':false, 'mensaje': decodedResp['error']['message'] };
    }


  }

  Future<Map<String, dynamic>> nuevoUsuario( String email, String password) async {

    final authData = {
      'email'     : email,
      'password'  : password,
      'returnSecureToken' : true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode( authData )
    );

    Map<String, dynamic> decodedResp = json.decode( resp.body );
    print(decodedResp);

    if ( decodedResp.containsKey('idToken') ) {

      _prefs.token = decodedResp['idToken'];

      return { 'ok':true, 'token': decodedResp['idToken'] };
    } else {
      return { 'ok':false, 'mensaje': decodedResp['error']['message'] };
    }


  }


}