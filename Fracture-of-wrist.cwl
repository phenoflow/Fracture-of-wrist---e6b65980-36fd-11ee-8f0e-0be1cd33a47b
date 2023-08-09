cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  fracture-of-wrist-closed---primary:
    run: fracture-of-wrist-closed---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  fracture-of-wrist-radioulnar---primary:
    run: fracture-of-wrist-radioulnar---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-closed---primary/output
  fracture-of-wrist-forearm---primary:
    run: fracture-of-wrist-forearm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-radioulnar---primary/output
  fracture-of-wrist-colle---primary:
    run: fracture-of-wrist-colle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-forearm---primary/output
  fracture-of-wrist-smith---primary:
    run: fracture-of-wrist-smith---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-colle---primary/output
  other-fracture-of-wrist---primary:
    run: other-fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-smith---primary/output
  fracture-of-wrist-process---primary:
    run: fracture-of-wrist-process---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: other-fracture-of-wrist---primary/output
  fracture-of-wrist-epiphysis---primary:
    run: fracture-of-wrist-epiphysis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-process---primary/output
  fracture-of-wrist-galeazzi---primary:
    run: fracture-of-wrist-galeazzi---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-epiphysis---primary/output
  volar-fracture-of-wrist---primary:
    run: volar-fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-galeazzi---primary/output
  fracture-of-wrist-dislocation---primary:
    run: fracture-of-wrist-dislocation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: volar-fracture-of-wrist---primary/output
  fracture-of-wrist-dorsal---primary:
    run: fracture-of-wrist-dorsal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-dislocation---primary/output
  radial-fracture-of-wrist---primary:
    run: radial-fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-dorsal---primary/output
  fracture-of-wrist-diepunch---primary:
    run: fracture-of-wrist-diepunch---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: radial-fracture-of-wrist---primary/output
  intraarticular-fracture-of-wrist---primary:
    run: intraarticular-fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-diepunch---primary/output
  fracture-of-wrist-barton---primary:
    run: fracture-of-wrist-barton---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: intraarticular-fracture-of-wrist---primary/output
  fracture-of-wrist---primary:
    run: fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-barton---primary/output
  lower-fracture-of-wrist---primary:
    run: lower-fracture-of-wrist---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist---primary/output
  fracture-of-wrist-radiocarpal---primary:
    run: fracture-of-wrist-radiocarpal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: lower-fracture-of-wrist---primary/output
  fracture-of-wrist-radius---secondary:
    run: fracture-of-wrist-radius---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-radiocarpal---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: fracture-of-wrist-radius---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
