import 'package:bloc/bloc.dart';

import 'game_disp_event.dart';
import 'game_disp_state.dart';

class GameDispBloc extends Bloc<GameDispEvent, GameDispState> {
  
  @override
  GameDispState get initialState => null;

  @override
  Stream<GameDispState> mapEventToState(GameDispState currentState, GameDispEvent event) async* {

  }

}