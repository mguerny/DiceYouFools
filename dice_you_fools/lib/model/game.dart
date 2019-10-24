import 'package:dice_you_fools/model/user.dart';

class Game {

   final String id;
   String name;
   String location;
   List<User> users;
   
  Game({this.id, this.name, this.location, this.users});

}