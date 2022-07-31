import 'package:flutter/material.dart';

import '../models/user_donation_model.dart';

class UserDonationProvider {
  List<UserDonation> donations = [];

  void addDonation(UserDonation currDonation)
  {
    donations.add(currDonation);
  }
}