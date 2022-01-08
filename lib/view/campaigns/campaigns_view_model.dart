import 'package:flutter/src/widgets/framework.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/model/campaign.dart';
import 'package:kazandirio/service/campaign_service.dart';

class CampaignsViewModel extends CustomBaseViewModel{
  List<Campaign>? campaigns;
  @override
  void initialize(BuildContext context) async {
    this.context = context;
    await getCampaigns();
  }

  Future getCampaigns()async{
    isLoading = true;
    var result = await CampaignService.instance!.getCampaigns();
    if(result != null){
      campaigns = result;
    }else {
      campaigns = [];
    }
    isLoading = false;
  }


}