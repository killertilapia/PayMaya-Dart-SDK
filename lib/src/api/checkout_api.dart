import 'package:paymaya_dart/src/core/checkout_api_manager.dart';
import 'package:paymaya_dart/src/models/checkout_data_models.dart';

class CheckoutAPI{
  CheckoutDataModel checkout_data;

  String public_api_key = '';
  String secret_api_key = '';
  String environment = 'SANDBOX';
  String encoded_key = '';

  CheckoutAPIManager manager;

  CheckoutAPI({String public_api_key = '', String secret_api_key = '', String environment = 'SANDBOX', String encoded_key = ''}){
    this.public_api_key = public_api_key;
    this.secret_api_key = secret_api_key;
    this.environment = environment;
    this.encoded_key = encoded_key;

    this.init_manager();
  }

  void init_manager(){
    if(this.encoded_key.isNotEmpty){
      this.manager = CheckoutAPIManager(this.public_api_key, this.secret_api_key, environment: this.environment, encoded_key: this.encoded_key);
    }else{
      this.manager = CheckoutAPIManager(this.public_api_key, this.secret_api_key, environment: this.environment);
    }
  }

  void initiate(CheckoutDataModel checkout_data){
    this.checkout_data = checkout_data;
  }

  Future<String> execute() async{
    return await this.manager.execute_checkout(); 
  }
}