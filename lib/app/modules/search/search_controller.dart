import 'package:algolia/algolia.dart';
import 'package:mobx/mobx.dart';
import 'package:tribo/app/shared/configuration/algoliaConfiguration.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

enum ServiceStatus {INIT,LOAD, READY, NOTFOUNDITEMS}

abstract class _SearchControllerBase with Store {

  _SearchControllerBase(){
    searchStatus = ServiceStatus.INIT;
  }

  @observable
  ServiceStatus searchStatus;

  @observable
  List<AlgoliaObjectSnapshot> results;

  @action
  Future onChangedSearch(String search) async {
    searchStatus = ServiceStatus.LOAD;

    Algolia algolia = Algolia.init(
      applicationId: AlgoliaConfiguration.getApplicationId(),
      apiKey:  AlgoliaConfiguration.getApiKey(),
    );

    AlgoliaQuery query = algolia.instance.index('services');
    query = query.search(search);

    results = (await query.getObjects()).hits;

    if(results!=null){
      searchStatus = ServiceStatus.READY;
    }else{
      searchStatus = ServiceStatus.NOTFOUNDITEMS;
    }
  }
}
