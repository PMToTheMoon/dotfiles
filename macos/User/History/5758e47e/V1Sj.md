# Build System
  - [ ] generators ordering
    - [ ] specify generator dependencies
      - [ ] by file extensions
      - [ ] by generator name
  - [ ] generator configs
    - [ ] find configs
    - [ ] find configs override
  - [ ] build steps
    - [ ] provide a way for generators to interact with world
  - [ ] build output
    - [ ] write assets to disk
  - [ ] clean command

# Additional Generator options
  - [ ] **Consume input** hide consumed inputs to next generators. useful for: models.yaml
  - [ ] **Hide outputs** hide generators outputs to next generators. avoid to run generator on unwanted output
  - [ ] **dependencies** dependency to other generator. dependencies are guarented to run before generator


# source parsing
- [ ] Yaml parsing
  - [ ] Checked yaml config proof of concept
  - [X] Yaml With header parser
- [ ] Cutsom format
  - [ ] Petit parser
