extension ListIndexExistsExtension<T> on List<T> {
  bool indexExists(int index) {
    return index >= 0 && index < this.length;
  }
}
