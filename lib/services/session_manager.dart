class SessionService {
  static final SessionService _session = SessionService._internal();

  String? userId;

  factory SessionService() {
    return _session;
  }

  SessionService._internal() {}
}
