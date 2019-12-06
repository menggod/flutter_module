class EventAgent {
  factory EventAgent() => _getInstance();

  static EventAgent get instance => _getInstance();
  static EventAgent _instance;

  EventAgent._internal() {
    //todo
  }

  static EventAgent _getInstance() {
    if (_instance == null) {
      _instance = new EventAgent._internal();
    }
    return _instance;
  }
  
  void sendEvent(){
    
  }
}
