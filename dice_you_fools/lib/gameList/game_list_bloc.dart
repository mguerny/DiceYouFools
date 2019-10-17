import 'package:bloc/bloc.dart';

import 'game_list_event.dart';
import 'game_list_state.dart';

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  
  @override
  GameListState get initialState => null;

  @override
  Stream<GameListState> mapEventToState(GameListState currentState, GameListEvent event) {
    return null;
  }



}