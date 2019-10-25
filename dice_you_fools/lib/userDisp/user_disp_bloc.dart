import 'package:bloc/bloc.dart';

import 'user_disp_event.dart';
import 'user_disp_state.dart';

class UserDispBloc extends Bloc<UserDispEvent, UserDispState> {
  
  @override
  UserDispState get initialState => null;

  @override
  Stream<UserDispState> mapEventToState(UserDispState currentState, UserDispEvent event) async* {

  }





}