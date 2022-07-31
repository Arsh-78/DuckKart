import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/models/user_donation_model.dart';
import 'package:untitled/src/resources/userDonationProvider.dart';

class UserDonationBloc
{
  UserDonationProvider userDonationProvider = UserDonationProvider();
  final _donationsFetcher = PublishSubject<List<UserDonation>>();

  Stream get getDonations => PublishSubject().stream;

  void updateDonations(UserDonation currDonation)
  {
    userDonationProvider.addDonation(currDonation);
    _donationsFetcher.sink.add(userDonationProvider.donations);
  }
  void dispose()
  {
    _donationsFetcher.close();
  }
}
final userDonationBloc = UserDonationBloc();