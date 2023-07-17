import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lachochant_app/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void verifyOTPCode({
    required BuildContext context, 
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }){
    authRepository.verifyOTP(
      context: context, 
      smsCodeId: smsCodeId, 
      smsCode: smsCode, 
      mounted: mounted);
  }

  void sendsSMS ({
    required BuildContext context, required String phone}){
      authRepository.sendOTP(context: context, phone: phone);
    }
}