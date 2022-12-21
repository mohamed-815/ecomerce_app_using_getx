import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orands_fish_booking/home/homescreen.dart';
import 'package:orands_fish_booking/registerpage/registerpage.dart';
import 'package:orands_fish_booking/registerpage/signpage.dart';

final email = FirebaseAuth.instance.currentUser!.email;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  GoogleSignIn googlesign = GoogleSignIn(scopes: ['email']);

  //email,password
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
    print('ddd');
    print(email);
  }

  _initialScreen(User? user) async {
    print(user);
    if (user == null) {
      print('hello');
      await Get.offAll(() => LoginPage());
    } else {
      await Get.offAll(() => HomeScreen());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('about user', 'User message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('failed'),
          messageText: Text(e.toString()));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('about user', 'User message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('login failed'),
          messageText: Text(e.toString()));
    }
  }

  void logOut() {
    auth.signOut();
  }

  void googlesign_methode() async {
    final GoogleSignInAccount? googleuser = await googlesign.signIn();
    final GoogleSignInAuthentication? googleauth =
        await googleuser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleauth?.idToken,
      accessToken: googleauth?.accessToken,
    );

    final user = (await auth
        .signInWithCredential(credential)
        .then((value) => Get.offAll(() => HomeScreen())));
  }

  void googlesignout() async {
    await googlesign.signOut();
  }
}
