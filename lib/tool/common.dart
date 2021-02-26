class Common {
  static final String DOMAIN = "http://10.0.10.53:3000";
  static final String TOKEN = "TOKEN";
  static final Event EVENT = Event();
}
class Event {
  final String call = 'call';
  final String newmsg = 'newmsg';
  final String allData = 'allData';
  final String isTyping = 'isTyping';
  final String inComing = 'inComing';
  final String onEndCall = 'onEndCall';
  final String getAllData = 'getAllData';
  final String startAnswer = 'startAnswer';
  final String startCall = 'startCall';
  final String Received = 'Received';
  final String onAnswerAccept = 'onAnswerAccept';
  final String endCall = 'endCall';
  final String sendmsg = 'sendmsg';
}