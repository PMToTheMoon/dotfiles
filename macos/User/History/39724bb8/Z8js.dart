/// A Single build step
///
/// Give access to the asset graph, containing sources inputs as well
/// outputs from previously ran generators. A [BuildStep] also provide way to
/// read assets and access to previous generator outputs meta data as well
/// writing to IPR and output
class BuildStep {
  BuildStep.from(BuildStep other);
}

class BuildStepIPR {}

class BuildStepOutput {}
