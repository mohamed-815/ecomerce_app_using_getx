import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:orands_fish_booking/cart/cart.dart';
import 'package:orands_fish_booking/orderpage.dart';
import 'package:orands_fish_booking/cart/modelclasses/ordermodelclass.dart';
import 'package:orands_fish_booking/cart/placeOrder.dart';
import 'package:orands_fish_booking/orderpage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

final placeordercontroller = Get.put(PlaceOrderController());
List<OrderModel> orderlist = [];

class PlaceOrderController extends GetxController {
  @override
  final razorpay = Razorpay();
  RxInt basevaleu = 1.obs;

  changingvaleu(int newvaleu) {
    basevaleu.value = newvaleu;
    print(basevaleu);
  }

  void onInit() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    // TODO: implement onInit
    super.onInit();
  }

  void handlePaymentSuccess(
    PaymentSuccessResponse response,
  ) async {
    // Do something when payment succeeds

    Get.snackbar('payment success', "SUCCESS");
    Addingtoorderlist();

    // orderlist = cartlist!
    //     .map((e) => OrderModel(
    //         locationdetail: locationdetails!.toJson(),
    //         minnomultiple: e.minnomultiple,
    //         subtotalprice: e.subtotalprice,
    //         description: e.description,
    //         imagelist: e.imagelist,
    //         name: e.name,
    //         category: e.category,
    //         minno: e.minno,
    //         price: e.price,
    //         size: e.size))
    //     .toList();

    print('ading to order list.......');
    await addingToFireBase(orderlist);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar('payment success', "FAILURE");
    print(Response());
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print(Response());

    Get.snackbar('Wallet', response.walletName ?? '');

    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    razorpay.clear();
    basevaleu.value = 1;
    print('object');
    Get.delete<PlaceOrderController>().then((value) =>
        print('mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm'));
    super.dispose();
  }
}

void openCheckout({required total}) async {
  var options = {
    'key': 'rzp_test_mVx2yOfKpR9ddr',
    'amount': 100 * total,
    'name': 'althaf.',
    'description': 'fish order',
    'prefill': {'contact': '8888888888', 'email': 'mohmedvgd34@gmail.com'}
  };

  try {
    placeordercontroller.razorpay.open(options);
  } catch (e) {
    print(e);
  }
}

addingToFireBase(List<OrderModel> orderlist) async {}

Addingtoorderlist() async {
  orderlist = cartlist!
      .map((e) => OrderModel(
          locationdetail: locationdetails!.toJson(),
          minnomultiple: e.minnomultiple,
          subtotalprice: e.subtotalprice,
          description: e.description,
          imagelist: e.imagelist,
          name: e.name,
          category: e.category,
          minno: e.minno,
          price: e.price,
          size: e.size))
      .toList();
  for (int i = 0; i <= orderlist.length; i++) {
    final addingtofirebase = FirebaseFirestore.instance
        .collection('collection')
        .doc('orders')
        .collection('orderlist')
        .doc();
    orderlist[i].id = addingtofirebase.id;
    final json = orderlist[i].toJson();
    print('..............oooo');
    ;
    await addingtofirebase
        .set(json)
        .then((value) => print('well ooooooooooooooo'));
  }
}
