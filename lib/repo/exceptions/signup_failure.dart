class SignupFailure {
  final String message;

  const SignupFailure([this.message = "An Error occured."]);

  factory SignupFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupFailure('Please enter a strong password');
      case 'invalid-email':
        return const SignupFailure('Email is invalid');
      case 'email-already-in-use':
        return const SignupFailure('This email is akready registered');
      case 'user-disabled':
        return const SignupFailure(
            'Please contact support, your account is disabled!');
      default:
        return const SignupFailure();
    }
  }
}
