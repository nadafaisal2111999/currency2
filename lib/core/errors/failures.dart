// الكلاس الأب لجميع الأخطاء في الـ Domain
abstract class Failure {
  final String message;
  const Failure(this.message);
}

// خطأ السيرفر أو الاتصال بالشبكة
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// خطأ التخزين المحلي (لو ضفنا Cache مستقبلاً)
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}