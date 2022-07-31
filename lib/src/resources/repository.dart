import 'package:flutter/material.dart';
import 'package:untitled/src/models/user_donation_model.dart';

import '../models/creator_model.dart';

class Repository {
  List<CreatorModel> allCreators = [] ;

  List<CreatorModel> getCreators ()
  {
    allCreators.add(CreatorModel(id: "C1", username: "CarryMinati", profession: "Youtuber", profileUrl: 'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/05/16/906281-carry-minati.jpg'));
    allCreators.add(CreatorModel(id: "C2", username: "BB Ki Vines", profession: "Actor", profileUrl:'https://m.media-amazon.com/images/M/MV5BOWVkNTk1ZTQtY2JkMS00ZjExLWJkZWMtNGQ2YTUzOTRlYjBkXkEyXkFqcGdeQXVyNzU3Nzk4MDQ@._V1_.jpg'));
    allCreators.add(CreatorModel(id: "C3", username: "Pewdiepie", profession: "Youtuber", profileUrl: 'https://i.insider.com/5ca1d6ccc6cc50118c102b34?width=1136&format=jpeg'));
    return allCreators ;
  }
}