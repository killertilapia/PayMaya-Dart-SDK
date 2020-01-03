import 'dart:math';
import 'package:test/test.dart';
import 'package:faker/faker.dart';

import 'package:paymaya_dart/src/models/amount_models.dart';
import 'package:paymaya_dart/src/models/buyer_models.dart';
import 'package:paymaya_dart/src/models/checkout_data_models.dart' show CheckoutDataModel;
import 'package:paymaya_dart/src/models/checkout_item_models.dart' show CheckoutItemModel;
import 'package:paymaya_dart/paymaya_sdk.dart';

import 'package:paymaya_dart/src/models/card_models.dart';

final List<CardModel> test_cards = [
  CardModel('5123456789012346', '12/2025', '111', card_type: 'MASTERCARD', password: ''),
  CardModel('5453010000064154', '12/2025', '111', card_type: 'MASTERCARD', password: 'secbarry1'),
  CardModel('4123450131001381', '12/2025', '123', card_type: 'VISA', password: 'mctest1'),
  CardModel('4123450131001522', '12/2025', '123', card_type: 'VISA', password: 'mctest1'),
  CardModel('4123450131004443', '12/2025', '123', card_type: 'VISA', password: 'mctest1'),
  CardModel('4123450131000508', '12/2025', '123', card_type: 'VISA', password: ''),
  CardModel('3550998167531014', '12/2025', '216', card_type: 'JBC', password: ''),
  CardModel('3550998167521049', '12/2025', '995', card_type: 'JBC', password: 'secure35'),
];

final List<Map<String, String>> test_API_keys = [
  {
    'name': 'Sandbox Party 1',
    'secret_key': 'sk-X8qolYjy62kIzEbr0QRK1h4b4KDVHaNcwMYk39jInSl',
    'public_key': 'pk-Z0OSzLvIcOI2UIvDhdTGVVfRSSeiGStnceqwUE7n0Ah',
    'service': 'Payment Vault Checkout'
  },
  {
    'name': 'Sandbox Party 2',
    'secret_key': 'sk-KfmfLJXFdV5t1inYN8lIOwSrueC1G27SCAklBqYCdrU',
    'public_key': 'pk-eo4sL393CWU5KmveJUaW8V730TTei2zY8zE4dHJDxkF',
    'service': 'Payment Vault Checkout'
  },
  {
    'name': 'Sandbox Party 3',
    'secret_key': 'sk-fzukI3GXrzNIUyvXY3n16cji8VTJITfzylz5o5QzZMC',
    'public_key': 'pk-lNAUk1jk7VPnf7koOT1uoGJoZJjmAxrbjpj6urB8EIA',
    'service': 'Payment Vault Checkout'
  },
  {
    'name': 'Sandbox Party 4',
    'secret_key': 'sk-VGDKY3P90NYZZ0kSWqBFaD1NTIXQCxtdS7SbQXvcA4g',
    'public_key': 'pk-yaj6GVzYkce52R193RIWpuRR5tTZKqzBWsUeCkP9EAf',
    'service': 'Payment Vault Checkout'
  },
  {
    'name': 'Sandbox Party 5',
    'secret_key': 'sk-8MqXdZYWV9UJB92Mc0i149CtzTWT7BYBQeiarM27iAi',
    'public_key': 'pk-NCLk7JeDbX1m22ZRMDYO9bEPowNWT5J4aNIKIbcTy2a',
    'service': 'Payment Vault Checkout'
  }
];

void main(){
  var faker = Faker();  

  var rng = Random();
  int merch_index = rng.nextInt(test_API_keys.length - 1);
  Map<String, String> merchant = test_API_keys[merch_index];

  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });

  test("CheckoutAPI() is not null", () async{
    var sdk = PayMayaDart(merchant['public_key'], merchant['secret_key'], 'cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo=', environment: 'SANDBOX');
    expect(sdk, equals(isNotNull));

    var api = sdk.checkout();
    expect(sdk, equals(isNotNull));

    var response = await api.execute();
    expect(response, equals(isMap));
  });
}