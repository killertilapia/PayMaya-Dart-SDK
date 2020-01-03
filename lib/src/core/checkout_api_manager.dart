import 'package:paymaya_dart/src/core/api_manager.dart';
import 'package:paymaya_dart/src/models/checkout_data_models.dart';

import 'package:paymaya_dart/src/constants.dart';

class CheckoutAPIManager extends APIManager{
  String base_url = '';
  CheckoutDataModel checkout_data;
  List checkouts = [];

  CheckoutAPIManager(String public_api_key, String secret_api_key, 
    {String environment = 'SANDBOX', String encoded_key = ''}) 
    : super(public_api_key, secret_api_key, environment: environment, encoded_key: encoded_key){
    
    this.base_url = this.get_base_url();
  }

  String get_base_url(){
    if(this.environment == PRODUCTION){
      return CHECKOUT_PRODUCTION_URL;
    }else{
      return CHECKOUT_SANDBOX_URL;
    }
  }

  Future execute_checkout() async{
    if(this.checkout_data == null){
      throw Exception('No checkout data');
    }

    String url = "${this.base_url}${CHECKOUTS_URL}";
    
    return await this.execute(url, this.checkout_data.serialize(), method: 'POST', key: this.encoded_key);    
  }

}