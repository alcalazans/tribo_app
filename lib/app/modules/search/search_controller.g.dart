// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  final _$searchStatusAtom = Atom(name: '_SearchControllerBase.searchStatus');

  @override
  ServiceStatus get searchStatus {
    _$searchStatusAtom.reportRead();
    return super.searchStatus;
  }

  @override
  set searchStatus(ServiceStatus value) {
    _$searchStatusAtom.reportWrite(value, super.searchStatus, () {
      super.searchStatus = value;
    });
  }

  final _$resultsAtom = Atom(name: '_SearchControllerBase.results');

  @override
  List<AlgoliaObjectSnapshot> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(List<AlgoliaObjectSnapshot> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$onChangedSearchAsyncAction =
      AsyncAction('_SearchControllerBase.onChangedSearch');

  @override
  Future<dynamic> onChangedSearch(String search) {
    return _$onChangedSearchAsyncAction
        .run(() => super.onChangedSearch(search));
  }

  @override
  String toString() {
    return '''
searchStatus: ${searchStatus},
results: ${results}
    ''';
  }
}
