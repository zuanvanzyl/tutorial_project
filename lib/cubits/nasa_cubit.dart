import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorial_project/api_helper/nasa_helper.dart';
import 'package:tutorial_project/constants/apod_model.dart';

part 'nasa_state.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaInitial());

  final NasaHelper _helper = NasaHelper();

  void getImage(String date) async {
    emit(NasaLoading(state.nasaState));
    try{
      final _model = await _helper.getPicture(date) ;
      emit(NasaLoaded(state.nasaState?.copyWith(apodModel: _model))) ;
    } catch (error) {
      emit(NasaError(state.nasaState, error.toString())) ;
    }
  }
}
