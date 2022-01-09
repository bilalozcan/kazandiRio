import 'package:flutter/material.dart';
import 'package:kazandirio/core/base/base_data.dart';
import 'package:kazandirio/core/base/base_view_model.dart';
import 'package:kazandirio/core/extension/context_extension.dart';
import 'package:kazandirio/firebase_services/firestore_services.dart';
import 'package:kazandirio/view/market/market_view.dart';

class EventViewModel extends CustomBaseViewModel {
  FirestoreServiceApp firestoreService = FirestoreServiceApp.instance!;
  BaseData baseData = BaseData.instance!;

  void initialize(BuildContext context) {
    this.context = context;
  }

  void marketButton() => context.navigateTo(MarketView());
}