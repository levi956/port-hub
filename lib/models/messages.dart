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
      )
    ];
  }
}

var users = Users.generateUsers();
