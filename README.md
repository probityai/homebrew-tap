# homebrew-tap

Homebrew formulas for the command line tools in the [probityai](https://github.com/probityai) repositories.

For anyone on macOS or Linux who wants these tools on their path without managing a Python environment.

```sh
brew install probityai/tap/probity-verify
```

Each formula installs one pinned PyPI release into its own virtual environment. `brew test` runs the tool, and CI builds and tests every formula from source on macOS and Linux.

| Formula | Commands | Source |
| --- | --- | --- |
| `probity-verify` 0.1.1 | `probity-verify`, `probity-bundle`, `probity-index` | [probityai/probity-verify](https://github.com/probityai/probity-verify) |
| `agent-evidence-vectors` 0.18.1 | `agent-evidence-vectors`, `agent-evidence-heldout` | [probityai/agent-evidence-vectors](https://github.com/probityai/agent-evidence-vectors) |
| `agent-evidence-admission` 0.1.0 | `agent-evidence-admission` | [probityai/agent-evidence/packages/admission](https://github.com/probityai/agent-evidence/tree/main/packages/admission) |
| `agent-evidence-observer` 0.0.1 | `agent-evidence-observer`, `agent-evidence-admit` | [probityai/agent-evidence-observer](https://github.com/probityai/agent-evidence-observer) |

Running `agent-evidence-vectors` with no arguments checks the bundled conformance vectors against the reference verifier and prints one PASS or FAIL row per vector:

```sh
brew install probityai/tap/agent-evidence-vectors
agent-evidence-vectors
```

The same packages install with `pip`, for example `pip install probity-verify==0.1.1`. Issues with a tool belong in its source repository; issues with a formula belong here.
