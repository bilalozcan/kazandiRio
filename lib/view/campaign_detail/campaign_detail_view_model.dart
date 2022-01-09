import 'package:flutter/src/widgets/framework.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/model/campaign.dart';
import 'package:kazandirio/service/campaign_service.dart';

class CampaignDetailViewModel extends CustomBaseViewModel {
  Campaign? campaign;

  void initialize(BuildContext context, String campaignId) async {
    this.context = context;
    await getCampaign(campaignId);
  }

  Future getCampaign(String id) async {
    isLoading = true;
    var result = await CampaignService.instance!.getCampaign(id);
    if (result != null) {
      campaign = result;
    }
    isLoading = false;
  }
}
