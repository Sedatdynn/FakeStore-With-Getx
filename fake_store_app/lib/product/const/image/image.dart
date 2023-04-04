class ImageConst {
  static ImageConst? _instance;
  static ImageConst get instance {
    _instance ??= ImageConst._init();
    return _instance!;
  }

  String constImage =
      "https://e7.pngegg.com/pngimages/910/744/png-clipart-illustration-coque-apple-iphone-4s-oops-fond-speech-bubble-comics-text.png";

  ImageConst._init();
}
