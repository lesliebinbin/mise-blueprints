# Mise Blueprints Agent Guide

This repository contains versioned Copier templates for generating
mise-managed projects.

## Layout

- Each top-level blueprint directory is a stable identifier.
- Each `vMAJOR.MINOR.PATCH` directory is a self-contained Copier template.
- Every version contains `copier.yml`, `answers.yml.example`, and `template/`.
- `README.org` is the human-facing repository documentation.

## Rules

- Treat released version directories as immutable. Create a new version for
  behavior changes.
- Keep every blueprint independently renderable.
- Use Copier/Jinja variables instead of ad hoc placeholder syntax.
- Keep `answers.yml.example` complete and non-interactive.
- Generated projects must use mise as their task and runtime entry point.
- Do not add generated output or dependency directories to this repository.
- Update `README.org` when adding a blueprint identifier or version.

## Validation

Run `mise check` after changing any template. It renders every example into a
temporary directory and removes the output afterward.
