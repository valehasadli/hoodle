import 'dart:io';
import 'package:meta/meta.dart';

import '../helpers/double_quote.dart';

// const String kBaseUrl = 'https://hoodle-translation-api.herokuapp.com';
const String kBaseUrl = 'http://localhost:8000';

Map<String, String> kAuthRequestHeaders({
  @required String rawToken,
}) {
  final String token = DoubleQuote.trim(rawToken);

  return <String, String>{
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token'
  };
}

Map<String, String> kGuestRequestHeaders() {
  return <String, String>{
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.acceptHeader: 'application/json',
  };
}
