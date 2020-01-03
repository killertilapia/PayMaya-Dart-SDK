library paymaya_sdk;

import 'package:paymaya_dart/src/api/checkout_api.dart';

class PayMayaDart{
  String public_api_key = '';
  String secret_api_key = '';
  String environment = '';
  String encoded_key = '';

  var api = null;

  PayMayaDart(String this.public_api_key, String this.secret_api_key, String this.encoded_key, {String this.environment: 'SANDBOX'});

  CheckoutAPI checkout(){
    this.api = CheckoutAPI(public_api_key: this.public_api_key, secret_api_key: this.secret_api_key, encoded_key: this.encoded_key, environment: this.environment);

    return this.api;
  }
}