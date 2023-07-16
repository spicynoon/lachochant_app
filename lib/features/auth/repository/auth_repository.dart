import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:lachochant_app/common/helpers/db_helper.dart';
import 'package:lachochant_app/common/widgets/show_dialogue.dart';
import '../../../common/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider((ref){
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  Future<void> verifyOTP({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: smsCodeId, smsCode: smsCode);

      await auth.signInWithCredential(credential);
      if (!mounted) {
        return;
      }
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    } on FirebaseAuth catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }

  Future<void> sendOTP ({
    required BuildContext context,
    required String phone,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber:  phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        }, 
        verificationFailed: (e){
          showAlertDialog(context: context, message: e.toString());
        }, 
        codeSent: (smsCodeId, resendCodeId){
          DBHelper.createUser(1);
          Navigator.pushAndRemoveUntil(
            context, 
            Routes.otp, 
            (route) => false,
            arguments: {
            'phone': phone,
            'smsCodeId': smsCodeId 
          });
        }, 
        codeAutoRetrievalTimeout: (String smsCodeId){});
    } on FirebaseAuth catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }
}

