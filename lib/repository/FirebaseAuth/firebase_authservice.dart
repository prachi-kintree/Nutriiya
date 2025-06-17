import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutriya/utils/styles/app_decoration.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  String userverificationId = "";
  int? firebaseResendToken;

  Future<bool> verifyOTPCode(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: userverificationId,
      smsCode: otp,
    );
    try {
      UserCredential user = await auth.signInWithCredential(credential);
      firebaseResendToken = null;
      userverificationId = "";
      auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  requestForOtp(
      {required String withPhoneNumber,
      required Function(String?) codeReceived,
      required Function() onFailed}) {
    print("Requesting Code for ${withPhoneNumber}");
    try {
      auth.verifyPhoneNumber(
          phoneNumber: withPhoneNumber,
          forceResendingToken: firebaseResendToken,
          verificationCompleted: (credentials) {},
          verificationFailed: (e) {
            onFailed();
            print(e);
            AppDecoration.showToast(message: "Verification Failed");
          },
          codeSent: (String verificationId, int? resendToken) {
            codeReceived(verificationId);

            userverificationId = verificationId;
            firebaseResendToken = resendToken;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            userverificationId = verificationId;
          });
    } catch (e) {
      print(e);
    }
  }
}
