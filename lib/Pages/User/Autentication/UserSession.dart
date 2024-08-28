class UserSession {
  static int _userCpf = 0;

  static void setUserCpf(int cpf) {
    _userCpf = cpf;
  }

  static int getUserCpf() {
    return _userCpf;
  }
}
