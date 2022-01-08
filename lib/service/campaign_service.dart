import 'package:kazandirio/core/init/network/network_manager.dart';

class CampaignService {
  static CampaignService? _instance;

  static CampaignService? get instance {
    _instance ??= CampaignService._init();
    return _instance;
  }

  CampaignService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;


}