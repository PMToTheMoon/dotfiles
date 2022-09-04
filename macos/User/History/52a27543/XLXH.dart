final tbtClient = ChopperClient(
  client: client,
  baseUrl: "http://localhost:8000",
  // bind your object factories here
  converter: converter,
  errorConverter: converter,
  services: [
    // the generated service
    MyService.create(),
  ],
  /* ResponseInterceptorFunc | RequestInterceptorFunc | ResponseInterceptor | RequestInterceptor */
  interceptors: [authHeader],
);
