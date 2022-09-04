@ToHook()
extension RecordsBlocTransformer on out.RecordsBloc {
  @Entrypoint()
  out.RecordsSuccess _buildSuccessState(
    out.RecordsState state,
    List<String> records,
  ) {
    return out.RecordsSuccess(
      records: records,
    );
  }
}
