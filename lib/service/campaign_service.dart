import 'package:kazandirio/core/constant/enum/network_enum.dart';
import 'package:kazandirio/core/init/network/network_manager.dart';
import 'package:kazandirio/model/campaign.dart';
import 'package:kazandirio/core/extension/network_extension.dart';

class CampaignService {
  static CampaignService? _instance;

  static CampaignService? get instance {
    _instance ??= CampaignService._init();
    return _instance;
  }

  CampaignService._init();

  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<List<Campaign>?> getCampaigns() async =>
      await _networkManager!.get(Network.CAMPAIGNS.value, Campaign());

  Future<Campaign?> getCampaign(String id) async =>
      await _networkManager!.get(Network.CAMPAIGNS.value + '/$id', Campaign());
}
