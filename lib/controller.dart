class Controller {
  int index = 0;

  void setIndex(int curr) {
    this.index = curr;
    print("index '$index'");
  }

  int getIndex() {
    print("index '$index'");
    return this.index;
  }
}