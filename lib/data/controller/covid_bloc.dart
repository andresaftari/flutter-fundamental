import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihanbloc/data/covid.dart';
import 'package:latihanbloc/data/remote/api_repo.dart';

part 'event/covid_event.dart';
part 'event/covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc() : super(CovidInitial()) {
    final ApiRepo _apiService = ApiRepo();

    on<GetCovidList>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await _apiService.getCovidList();
        emit(CovidLoaded(mList));

        if (mList.error != null) {
          emit(CovidError(mList.error));
        }
      } on DioError {
        emit(const CovidError('Failed! Device is offline'));
      }
    });
  }
}
