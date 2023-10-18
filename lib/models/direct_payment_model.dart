class directPaymentModel {
  int? status;
  String? message;
  Data? data;

  directPaymentModel({this.status, this.message, this.data});

  directPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sessionId;
  int? transactionId;
  String? referenceId;
  String? via;
  String? channel;
  String? paymentNo;
  String? paymentName;
  int? total;
  int? fee;
  String? expired;

  Data(
      {this.sessionId,
        this.transactionId,
        this.referenceId,
        this.via,
        this.channel,
        this.paymentNo,
        this.paymentName,
        this.total,
        this.fee,
        this.expired});

  Data.fromJson(Map<String, dynamic> json) {
    sessionId = json['SessionId'];
    transactionId = json['TransactionId'];
    referenceId = json['ReferenceId'];
    via = json['Via'];
    channel = json['Channel'];
    paymentNo = json['PaymentNo'];
    paymentName = json['PaymentName'];
    total = json['Total'];
    fee = json['Fee'];
    expired = json['Expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SessionId'] = this.sessionId;
    data['TransactionId'] = this.transactionId;
    data['ReferenceId'] = this.referenceId;
    data['Via'] = this.via;
    data['Channel'] = this.channel;
    data['PaymentNo'] = this.paymentNo;
    data['PaymentName'] = this.paymentName;
    data['Total'] = this.total;
    data['Fee'] = this.fee;
    data['Expired'] = this.expired;
    return data;
  }
}
