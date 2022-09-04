void main(List<String> arguments) {
    final file = File('{{input}}');
  if (!await file.exists()) {
    context.logger.err("API: input file not found");
    return;
  }
  final data = loadYaml(await file.readAsString()).toMapS();
}
