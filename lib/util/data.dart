class Data {
  bool status = false;

  static List<String> keys = [
    'field1',
    'field2',
    'field3',
    'field4',
  ];

  void setLoaded() {
    status = true;
  }

  bool get isloaded {
    return this.status;
  }
}
