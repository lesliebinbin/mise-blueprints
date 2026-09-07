# Mise Blueprints Agent Guide

This repository contains versioned Copier templates for generating
mise-managed projects.

## Layout

- `master` contains the blueprint catalog and documentation, not a template.
- Each `BLUEPRINT/vMAJOR.MINOR.PATCH` branch is a self-contained Copier template;
  `BLUEPRINT` is the stable identifier.
- Every template branch contains `copier.yml`, `answers.yml.example`, and
  `template/` at its root.
- `README.org` on `master` is the human-facing catalog; template branches and
  generated projects have their own usage documentation.

## Rules

- Treat released version branches as immutable. Create a new version branch for
  behavior changes.
- Keep every blueprint independently renderable.
- Use Copier/Jinja variables instead of ad hoc placeholder syntax.
- Keep `answers.yml.example` complete and non-interactive.
- Generated projects must use mise as their task and runtime entry point.
- Do not add generated output or dependency directories to this repository.
- Update `README.org` on `master` when adding a blueprint identifier or version.

## Validation

There is no repository-wide `mise check` task on `master`.

After changing a template, render the relevant version with its complete
`answers.yml.example` into a temporary directory outside this repository.
Confirm that rendering succeeds and leaves no unresolved template expressions
or `.jinja` filenames. In the generated project, run `mise install`, then
`mise setup` and `mise check` when those tasks exist and the blueprint's external
prerequisites are installed. Report any checks that could not run and why.
Remove the temporary output afterward; `mise check` does not perform rendering
or cleanup for you.

For documentation-only changes, check the diff and verify referenced branch
names and file paths; template rendering is not required.
