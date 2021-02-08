import 'dart:io';
import 'package:meta/meta.dart';

const String kBaseUrl = 'https://hoodle-translation-api.herokuapp.com/api';

Map<String, String> kAuthRequestHeaders({@required String token}) {
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token'
  };
}

Map<String, String> kGuestRequestHeaders() {
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };
}
