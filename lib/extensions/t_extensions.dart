import 'dart:developer' as developer;

extension TExtension<T> on T {
  T get logType {
    log("$runtimeType");
    return this;
  }

  T get logValue {
    developer.log(toString());
    return this;
  }

  T get logValueType {
    developer.log("${toString()} ($runtimeType)");
    return this;
  }

  T log(String tag) {
    developer.log("$tag : ${toString()}");
    return this;
  }
}
