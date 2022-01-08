import 'package:kazandirio/core/constant/enum/network_enum.dart';
import 'package:kazandirio/core/extension/network_extension.dart';
import 'package:kazandirio/core/init/network/network_manager.dart';
import 'package:kazandirio/model/login_response.dart';
import 'package:kazandirio/model/validate_response.dart';

class AuthService {
  static AuthService? _instance;

  static AuthService? get instance {
    _instance ??= AuthService._init();
    return _instance;
  }

  AuthService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<LoginResponse?> login(String phoneNumber) async =>
      await _networkManager!.post(
          Network.LOGIN.value, {'phoneNumber': phoneNumber}, LoginResponse());

  Future<ValidateResponse?> validate(
          String phoneNumber, String validationCode) async =>
      await _networkManager!.post(
          Network.LOGIN.value,
          {'phoneNumber': phoneNumber, 'validationCode': validationCode},
          ValidateResponse());
}
