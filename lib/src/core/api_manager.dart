import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class APIManager{
  String public_api_key = '';
  String secret_api_key = '';
  String environment = '';
  Map<String, String> http_headers = null;
  String encoded_key = '';

  APIManager(String public_api_key, String secret_api_key, {String environment = 'SANDBOX', String encoded_key = ''}){
    this.public_api_key = public_api_key;
    this.secret_api_key = secret_api_key;
    this.environment = environment;
    this.http_headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    this.encoded_key = encoded_key;
  }

  void useBasicAuthWithApiKey(String api_key){
    if(this.public_api_key.isEmpty && this.encoded_key.isEmpty){
      throw Exception("API key is requred");
    }

    var token = null;
    if(this.encoded_key.isNotEmpty){
      token = this.encoded_key;
    }else{
      var temp_encoded_token = base64.encode(utf8.encode(api_key));
      token = base64.decode(temp_encoded_token);
    }

    this.http_headers[HttpHeaders.authorizationHeader] = "Basic ${token}";
  }

  Future<String> execute(String url, String key, String method, String payload) async{
    String api_key = '';

    if(key.isNotEmpty){
      api_key = this.public_api_key;
    }else{
      api_key = this.secret_api_key;
    }

    this.useBasicAuthWithApiKey(api_key);

    if(method == 'GET'){
      final response = await http.get(url, headers: this.http_headers);
      return response.body;
    }else if(method == 'POST'){
      final response = await http.post(url, headers: this.http_headers, body: payload);
      return response.body;
    }else{
      throw Exception('Method not supported');
    }
  }

  Future<String> query(String url, String key) async{
    String api_key = '';

    if(key.isNotEmpty){
      api_key = this.public_api_key;
    }else{
      api_key = this.secret_api_key;
    }

    this.useBasicAuthWithApiKey(api_key);

    final response = await http.get(url, headers: this.http_headers);      
    return response.body;    
  }
}