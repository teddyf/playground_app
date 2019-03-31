class Singleton {
  static final Singleton _singleton = new Singleton._internal();
  static int index = 0;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static void setIndex(int newIndex) {
    index = newIndex;
  }

  static int getIndex() {
    return index;
  }
}