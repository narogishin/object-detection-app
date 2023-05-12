Future<List<List<List<int>>>> HandleImage(image) async {
  final width = image.width;
  final height = image.height;

  final List<List<List<int>>> pixels = List.generate(
    height,
    (_) => List.generate(
      width,
      (_) => List.generate(
        3,
        (_) => 0,
      ),
    ),
  );

  final byteData = await image.toByteData();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      final pixelOffset = (y * width + x) * 4;
      final r = byteData.getUint8(pixelOffset);
      final g = byteData.getUint8(pixelOffset + 1);
      final b = byteData.getUint8(pixelOffset + 2);
      pixels[y][x] = [b, g, r];
    }
  }
  return pixels;
}
