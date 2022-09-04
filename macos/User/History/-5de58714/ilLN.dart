typedef GeneratorOptions = Map<String, dynamic>;

/// Creates a [Generator] honoring the configuation in [options].
typedef GeneratorFactory = Generator Function(GeneratorOptions options);
