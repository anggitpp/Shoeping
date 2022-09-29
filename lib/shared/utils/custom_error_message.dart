class CustomErrorMessage {
  String firebaseErrorMessage(String code) {
    switch (code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email sudah digunakan, silahkan gunakan email lain.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Email/Password yang anda masukan salah.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "Email yang anda masukkan tidak terdaftar.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User terdisabled, silahkan hubungi administrator.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Terlalu banyak percobaan untuk login, silahkan coba bbrp saat lagi";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, silahkan coba lagi";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email tidak sesuai, silahkan masukan email yang valid";
      default:
        return "Gagal, mohon coba bbrp saat lagi";
    }
  }
}
