import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'landingpage_event.dart';
part 'landingpage_state.dart';

class LandingpageBloc extends Bloc<LandingpageEvent, LandingpageState> {
  LandingpageBloc() : super(LandingpageInitial()) {
    on<LandingpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
