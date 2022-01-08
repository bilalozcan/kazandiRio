import 'package:kazandirio/core/constant/enum/network_enum.dart';
import 'package:kazandirio/core/init/network/network_manager.dart';
import 'package:kazandirio/core/extension/network_extension.dart';
import 'package:kazandirio/model/gain.dart';

class CodeService {
  static CodeService? _instance;

  static CodeService? get instance {
    _instance ??= CodeService._init();
    return _instance;
  }

  CodeService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<Gain?> codeRedeem(String code) async => await _networkManager!
      .post(Network.CODE.value + code + Network.REDEEM.value, {}, Gain());
}
