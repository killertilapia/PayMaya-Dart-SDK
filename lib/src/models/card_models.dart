import 'dart:convert';

import 'package:credit_card_validator/credit_card_validator.dart';

class CardModel with CreditCardValidator {
  String card_type;
  String number;
  String expiry_date;
  String cvc;
  String password;
  String token;
  String token_state;

  CardModel(String this.number, String this.expiry_date, String this.cvc,
      {String this.card_type = null, String this.password = ''}) {
    if (this.validateCCNum(number).isValid) {
      this.number = number;
    } else {
      throw Exception('Credit card number is invalid');
    }

    if (this.validateExpDate(expiry_date).isValid) {
      this.expiry_date = expiry_date;
    } else {
      throw Exception('Expiry date is invalid');
    }

    if (this.validateSecurityCode(cvc).isValid) {
      this.cvc = cvc;
    } else {
      throw Exception('CVC is invalid');
    }

    this.card_type = card_type ?? this.validateCCNum(number).ccType;
    this.password = password;
  }

  Map<String, String> asDict(){
    List<String> cc_date_split = this.expiry_date.split('/');

    var data = {
      "number": this.number,
      "cvc": this.cvc,
      "expMonth": cc_date_split[0],
      "expYear": cc_date_split[1]
    };

    return data;
  }

  String serialize(){
    return json.encode({'card': this.asDict()});
  }
}
