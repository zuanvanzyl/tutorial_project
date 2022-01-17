part of 'nasa_cubit.dart';

class MainNasaState extends Equatable{
  final ApodModel? apodModel;

  const MainNasaState({
    this.apodModel,
  });

  @override
  List<Object?> get props => [ApodModel] ;

  MainNasaState copyWith({
    ApodModel? apodModel,
  }) {
    return MainNasaState(
      apodModel: apodModel ?? this.apodModel,
    );
  }
}

abstract class NasaState extends Equatable {
  final MainNasaState? nasaState;

  const NasaState(this.nasaState) ;

  @override
  List<Object?> get props => [nasaState] ;
}


class NasaInitial extends NasaState {
  NasaInitial() : super(MainNasaState()) ;
}
class NasaLoading extends NasaState {
  NasaLoading(MainNasaState? nasaState) : super(MainNasaState()) ;
}
class NasaLoaded extends NasaState {
  NasaLoaded(MainNasaState? nasaStates) : super(MainNasaState()) ;
}
class NasaError extends NasaState {
  final String error;
  NasaError(MainNasaState? nasaStates, this.error) : super(MainNasaState()) ;
}

