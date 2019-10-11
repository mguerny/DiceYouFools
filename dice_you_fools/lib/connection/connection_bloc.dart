import 'package:bloc/bloc.dart';
import 'package:dice_you_fools/connection/connection_event.dart';
import 'package:dice_you_fools/connection/connection_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => // TODO: implement initialState;

  @override
  Stream<MyState> mapEventToState(
    MyEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}