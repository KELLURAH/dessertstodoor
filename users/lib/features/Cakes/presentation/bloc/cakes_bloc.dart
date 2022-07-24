import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cakes_event.dart';
part 'cakes_state.dart';

class CakesBloc extends Bloc<CakesEvent, CakesState> {
  CakesBloc() : super(CakesInitial()) {
    on<CakesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
