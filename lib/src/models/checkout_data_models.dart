import 'dart:convert';

import 'package:paymaya_dart/src/models/amount_models.dart';
import 'package:paymaya_dart/src/models/buyer_models.dart';
import 'package:paymaya_dart/src/constants.dart' show REDIRECT_URLS;
import 'package:paymaya_dart/src/models/checkout_item_models.dart';

class CheckoutDataModel{
  TotalAmountModel total_amount;
  BuyerModel buyer;
  List<CheckoutItemModel> items;
  Map<String, dynamic> redirect_urls;
  String request_reference_number;
  Map<String, dynamic> metadata;

  CheckoutDataModel(){
    this.total_amount = TotalAmountModel();
    this.buyer = BuyerModel();
    this.items = [];
    this.redirect_urls = REDIRECT_URLS;
    this.request_reference_number = '';
    this.metadata = {};
  }

  @override
  String toString(){
    return "Checkout data for ${this.buyer}";
  }

  Map<String, dynamic> asDict(){
    var data = {
      "totalAmount": this.total_amount.asDict(),
      "buyer": this.buyer.asDict(),
      "items": this.items,
      "redirectUrl": this.redirect_urls,
      "requestReferenceNumber": this.request_reference_number,
      "metadata": this.metadata
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }

  void addItem(CheckoutItemModel item){
    this.items.add(item);
  }
}