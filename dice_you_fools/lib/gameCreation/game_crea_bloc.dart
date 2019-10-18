import 'package:bloc/bloc.dart';

import 'game_crea_event.dart';
import 'game_crea_state.dart';

class GameCreaBloc extends Bloc<GameCreaEvent, GameCreaState> {
  
  @override
  GameCreaState get initialState => null;

  @override
  Stream<GameCreaState> mapEventToState(GameCreaState currentState, GameCreaEvent event) {
    return null;
  }



}