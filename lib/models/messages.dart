import 'user.dart';

class Message {
  Users? user;
  String? lastMessage;
  String? lastTime;
  bool? isContinue;

  Message(
      {this.user, this.lastMessage, this.lastTime, this.isContinue = false});

  static List<Message?> generateHomePageMessage() {
    return [
      Message(
        user: users[0],
        lastMessage: 'I will forward your message to the school utility',
        lastTime: '2:30',
      ),
      Message(
        user: users[1],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
      Message(
        user: users[2],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
      Message(
        user: users[2],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
      Message(
        user: users[2],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
      Message(
        user: users[2],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
      Message(
        user: users[2],
        lastMessage: 'Repairs of your door would be peformed on this day :',
        lastTime: '2:30',
      ),
    ];
  }

  static List<Message?> generateMessageFromFirstUser() {
    return [
      Message(
          user: users[0], lastMessage: 'Bro what\'s good?', lastTime: '2:30'),
      Message(
          user: me,
          lastMessage: 'Man i just dey alright sha',
          lastTime: '2:31'),
      Message(user: users[0], lastMessage: 'Where are you', lastTime: '2:32'),
      Message(
          user: me, lastMessage: 'Just home playing fifa', lastTime: '2:34'),
    ];
  }
}

var users = Users.generateUsers();
var me = Users(
  id: 0,
  firstName: 'Nifesi',
  lastName: 'Odumrin',
  profilePhoto: 'assets/images/nifesi1.JPG',
);
