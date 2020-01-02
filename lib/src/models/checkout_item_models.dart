import 'dart:convert';

import 'package:paymaya_dart/src/models/amount_models.dart';


class CheckoutItemModel{
  String name;
  String code;
  String description;
  num quantity;
  TotalAmountModel amount;
  TotalAmountModel total_amount;

  CheckoutItemModel({String this.name = '', String this.code = '', String this.description = '', num this.quantity = 0}){
    this.name = name;
    this.code = code;
    this.description = description;
    this.quantity = quantity;
    this.amount = TotalAmountModel();
    this.total_amount = TotalAmountModel();
  }

  @override
  String toString(){
    return this.name;
  }

  Map<String, dynamic> asDict(){
    var data = {
      'name': this.name,
      'code': this.code,
      'description': this.description,
      'quantity': this.quantity,
      'amount': this.amount.asDict(),
      'totalAmount': this.total_amount.asDict()
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}