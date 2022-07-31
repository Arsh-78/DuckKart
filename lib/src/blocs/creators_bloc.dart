import 'package:rxdart/rxdart.dart';
import 'package:untitled/src/models/creator_model.dart';
import 'package:untitled/src/resources/repository.dart';

class CreatorsBloc{
  final _repository = Repository();
  final _creatorsFetcher = PublishSubject<List<CreatorModel>>();

  Stream<List<CreatorModel>> get allCreators => _creatorsFetcher.stream;

  fetchAllCreators() async {
    List<CreatorModel> creatorModels = await _repository.getCreators();
    _creatorsFetcher.sink.add(creatorModels);
  }

  dispose(){
    _creatorsFetcher.close();
  }

}

final bloc = CreatorsBloc();