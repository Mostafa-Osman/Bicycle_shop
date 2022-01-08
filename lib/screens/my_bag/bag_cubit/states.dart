

import 'package:udemy_flutter/screens/my_bag/model/add_to_bag_model.dart';

abstract class BagStates {}

class BagInitialState extends BagStates {}

class AddToBagLoadingState extends BagStates {}

class AddToBagSuccessState extends BagStates {}

class AddToBagErrorState extends BagStates {}

class BagUpdateQuantityLoadingState extends BagStates {}

class BagUpdateQuantitySuccessState extends BagStates {
  final AddToBagModel updateQuantityModel;

  BagUpdateQuantitySuccessState(this.updateQuantityModel);
}

class BagUpdateQuantityErrorState extends BagStates {}

class DeleteFromBagLoadingState extends BagStates {}

class DeleteFromBagSuccessState extends BagStates {}

class DeleteFromBagErrorState extends BagStates {}

class ShopGetOrderLoadingState extends BagStates {}


class ShopGetOrderSuccessState extends BagStates {
  final AddToBagModel model;

  ShopGetOrderSuccessState(this.model);
}

class ShopGetOrderErrorState extends BagStates {}
class BagCountState extends BagStates {}
