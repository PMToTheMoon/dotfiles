Bonemeal is a code generator that takes its inputs from a intermediate project representation called IPR and output standalone packages or complete apps.
The IPR is a fully valid working environnement, that act as an higher order representation of the target output project.

**bonemeal**
[!bonemeal_workflow](/assets/doc/bonemeal_workflow.jpg)

# OLD descriptions

bonemeal is a code generator that generate complete project output at once.
Generation is based on a work directory called intermediate project representation. The IPR (intermediate project representation) contain definition files written in yaml format and custom dart code called hooks that will be integrated to the generated project output.
To make sure hooks are written in a valid dart environnement, bonemeal will generate hooks dependencies inside the IPR.
The bonemeal workflow will follow theses steps:
First, provide initial project definitions (skeleton.yaml, ...)
Second, generate IPR context using bonemeal build ipr
Third, implement code hooks
Fourth, export project output using bonemeal export
User will mainly iterate over the three first steps and occasionally export the project output when it's ready.
The IPR is a valid dart project. It may contain dependencies and unit tests.


bonemeal is a dart package that comes with a CLI.
bonemeal CLI is used to:
  - create new [bonemeal projects]()
  - export generated output based on bonemeal config. see [bonemeal.yaml config file]().
CLI scripts are located inside the bin/ folder.

bonemeal package contains builders necessary to generate intermediate project representation and output projects.
builder are based on the [dart build system]().
builders sources are located inside the lib/ folder
builder will generate for two main destinations:
  - IPR context is generated to source or cache like any regular builder
  - Project output is generated to .bonemeal/generated/. This folder will later be exported to distant folders using Grinder package