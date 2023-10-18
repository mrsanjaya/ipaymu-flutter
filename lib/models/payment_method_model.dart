class paymentMethodModel {
  int? status;
  bool? success;
  String? message;
  List<Data>? data;

  paymentMethodModel({this.status, this.success, this.message, this.data});

  paymentMethodModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    success = json['Success'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Success'] = this.success;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? code;
  String? name;
  String? description;
  List<Channels>? channels;

  Data({this.code, this.name, this.description, this.channels});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    name = json['Name'];
    description = json['Description'];
    if (json['Channels'] != null) {
      channels = <Channels>[];
      json['Channels'].forEach((v) {
        channels!.add(new Channels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['Description'] = this.description;
    if (this.channels != null) {
      data['Channels'] = this.channels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Channels {
  String? code;
  String? name;
  String? description;
  String? paymentIntrucionsDoc;
  TransactionFee? transactionFee;

  Channels(
      {this.code,
        this.name,
        this.description,
        this.paymentIntrucionsDoc,
        this.transactionFee});

  Channels.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    name = json['Name'];
    description = json['Description'];
    paymentIntrucionsDoc = json['PaymentIntrucionsDoc'];
    transactionFee = json['TransactionFee'] != null
        ? new TransactionFee.fromJson(json['TransactionFee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['PaymentIntrucionsDoc'] = this.paymentIntrucionsDoc;
    if (this.transactionFee != null) {
      data['TransactionFee'] = this.transactionFee!.toJson();
    }
    return data;
  }
}

class TransactionFee {
  double? actualFee;
  String? actualFeeType;
  int? additionalFee;

  TransactionFee({this.actualFee, this.actualFeeType, this.additionalFee});

  TransactionFee.fromJson(Map<String, dynamic> json) {
    actualFee = double.parse(json['ActualFee'].toString());
    actualFeeType = json['ActualFeeType'];
    additionalFee = json['AdditionalFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActualFee'] = this.actualFee;
    data['ActualFeeType'] = this.actualFeeType;
    data['AdditionalFee'] = this.additionalFee;
    return data;
  }
}
