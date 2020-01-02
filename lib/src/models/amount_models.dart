import 'dart:convert';

class AmountModel{
  num total;
  String currency_code;

  AmountModel({num this.total = 0.0, String this.currency_code: 'PHP'}){
    this.total = total;
    this.currency_code = currency_code;
  }

  String totalAsStr(){
    return this.total.toStringAsFixed(2);
  }

  Map<String, dynamic> asDict(){
    var data = {'amount': this.total.toStringAsFixed(2), 'currency': this.currency_code};

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}


class TotalAmountDetailModel{
  num discount = 0;
  num service_charge = 0;
  num shipping_fee = 0;
  num tax = 0;
  num subtotal = 0;

  TotalAmountDetailModel(this.discount, this.service_charge, this.shipping_fee, this.tax, this.subtotal);

  Map<String, dynamic> asDict(){
    var data = {
      'discount': this.discount.toStringAsFixed(2),
      'serviceCharge': this.service_charge.toStringAsFixed(2),
      'shippingFee': this.shipping_fee.toStringAsFixed(2),
      'tax': this.tax.toStringAsFixed(2),
      'subtotal': this.subtotal.toStringAsFixed(2)
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}


class TotalAmountModel{
  AmountModel amount;
  TotalAmountDetailModel details;

  TotalAmountModel({AmountModel this.amount = null, TotalAmountDetailModel this.details = null}){
    this.amount = amount ?? AmountModel();
    this.details = details;
  }

  Map<String, dynamic> asDict(){
    var data = {
      'currency': this.amount.currency_code,
      'value': this.amount.totalAsStr(),
      'details': this.details.asDict() ?? {}
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}