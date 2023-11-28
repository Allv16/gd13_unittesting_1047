import 'package:flutter_test/flutter_test.dart';
import 'package:gd13_unittesting_1047/repository/login_repository.dart';

void main() {
  test('login success', () async {
    final hasil = await LoginRepository.logintesting(
        username: 'Yohanes Alvian Wijaya_1047', password: 'C_1047');
    expect(hasil?.data.username, equals('Yohanes Alvian Wijaya_1047'));
    expect(hasil?.data.password, 'C_1047');
  });

  test('login failed', () async {
    final result = await LoginRepository.logintesting(
        username: 'invalid', password: 'invalid');
    expect(result, null);
  });
}
