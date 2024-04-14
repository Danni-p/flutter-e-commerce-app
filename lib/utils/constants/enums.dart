enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

enum StorageBucket {
  avatars('avatars');

  const StorageBucket(this.value);
  final String value;
}