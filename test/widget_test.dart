import 'package:flutter_test/flutter_test.dart';
import 'package:mobxTest/stores/login_store.dart';

void main() {
  test(
      'When e-mail is valid, should return true', () {
    final loginStore = LoginStore();
    final email = loginStore.setEmail("eduardo@gmail.com");
    expect(loginStore.isEmailValid, true);
  });

  test(
      'When password > 6, should return true', () {
    final loginStore = LoginStore();
    final password = loginStore.setPassword("123456");
    expect(loginStore.isPasswordValid, true);
  });

  test(
      'When password > 6 and e-mail is valid, should return true', () {
    final loginStore = LoginStore();
    final password = loginStore.setPassword("123456");
    final email = loginStore.setEmail("eduardo@gmail.com");
    expect(loginStore.isFormValid, true);
  });

  test(
      'When password < 6 and e-mail is valid, should return false', () {
    final loginStore = LoginStore();
    final password = loginStore.setPassword("12345");
    final email = loginStore.setEmail("eduardo@gmail.com");
    expect(loginStore.isFormValid, false);
  });

  test(
      'When password > 6 and e-mail isn\'t valid, should return false', () {
    final loginStore = LoginStore();
    final password = loginStore.setPassword("123456");
    final email = loginStore.setEmail("emailNotValid");
    expect(loginStore.isFormValid, false);
  });
}