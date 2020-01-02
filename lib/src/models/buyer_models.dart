import 'dart:convert';

class BuyerAddressModel{
  String address1 = '';
  String address2 = '';
  String city = '';
  String state = '';
  String zip_code = '';
  String country = '';

  BuyerAddressModel({String this.address1, String this.address2, this.city, this.state, this.zip_code, this.country = 'PH'});

  @override
  String toString(){
    return "${this.address1} ${this.address2} ${this.city}";
  }

  Map<String, String> asDict(){
    var data = {
      'line1': this.address1,
      'line2': this.address2,
      'city': this.city,
      'state': this.state,
      'zipCode': this.zip_code,
      'countryCode': this.country
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}


class BuyerContactModel{
  String phone;
  String email;

  BuyerContactModel({this.phone = '', this.email = ''});

  Map<String, String> asDict(){
    var data = {'phone': this.phone, 'email': this.email};
    
    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}


class BuyerModel{
  String firstName;
  String middleName;
  String lastName;
  BuyerContactModel contact;
  BuyerAddressModel billingAddress;
  BuyerAddressModel shippingAddress;
  String ipAddress;
  String customerId;

  BuyerModel({String this.firstName = '', String this.lastName = '', String this.middleName = ''}){
    this.firstName = firstName;
    this.middleName = middleName;
    this.lastName = lastName;
    this.contact = BuyerContactModel();
    this.billingAddress = BuyerAddressModel();
    this.shippingAddress = BuyerAddressModel();
    this.ipAddress = '0.0.0.0';
    this.customerId = '';
  }

  @override
  String toString(){
    return "${this.lastName}, ${this.firstName}";
  }

  Map<String, dynamic> asDict(){
    var data = {
      'firstName': this.firstName,
      'middleName': this.middleName,
      'lastName': this.lastName,
      'contact': this.contact.asDict(),
      'billingAddress': this.billingAddress.asDict(),
      'shippingAddress': this.shippingAddress.asDict(),
      'ipAddress': this.ipAddress
    };

    return data;
  }

  String serialize(){
    return json.encode(this.asDict());
  }
}