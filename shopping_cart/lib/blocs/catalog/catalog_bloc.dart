import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/models.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogLoading());

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is CatalogStarted) {
      yield* _mapCatalogStartedToState();
    }
  }

  Stream<CatalogState> _mapCatalogStartedToState() async* {
    yield CatalogLoading();
    try {
      Future<void>.delayed(Duration(milliseconds: 700));
      yield CatalogLoaded(Catalog());
    } catch (error) {
      yield CatalogError();
    }
  }
}
