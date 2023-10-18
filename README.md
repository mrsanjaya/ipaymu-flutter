
# Ipaymu Flutter (Un-official)

This plugin is for connecting Flutter with payment gateway (IPAYMU)



## Usage/Examples

Get Payment List
```dart
var ipaymu = Ipaymu(vaNumber: "YOUR_VA_NUMBER", apiKey: "YOUR_API_KEY");
paymentMethodModel list = await ipaymu.getPaymentList();
```

Direct Payment
```dart
var body = {
    'name': 'Buyer',
    'phone': '081999501092',
    'email': 'buyer@mail.com',
    'amount': '10000',
    'notifyUrl': 'https://mywebsite.com',
    'expired': '24',
    'comments': 'Payment to XYZ',
    'referenceId': '1',
    'paymentMethod': 'cc',
    'paymentChannel': 'cc',
    'feeDirection': 'BUYER'
};

var ipaymu = Ipaymu(vaNumber: "YOUR_VA_NUMBER", apiKey: "YOUR_API_KEY");
directPaymentModel payment = await ipaymu.directPayment(body);
```


## License

[MIT](https://choosealicense.com/licenses/mit/)

