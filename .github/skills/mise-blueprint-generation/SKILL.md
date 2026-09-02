---
name: mise-blueprint-generation
description: Select and render a versioned mise-managed project blueprint with Copier. Use when asked to scaffold, initialize, or generate a project from this repository.
---

# Generate a project from a mise blueprint

1. Read `README.org` and list the available blueprint identifiers and branch versions.
2. Select the blueprint that matches the requested project type. Never silently
   substitute a different identifier or compatibility version.
3. Use the selected branch as the remote Copier template source.
4. Convert the user's requirements into a complete YAML answers file. Preserve
   types and satisfy all validators declared in `copier.yml`.
5. Ask for a decision only when an unanswered choice materially changes project
   behavior. Otherwise use the blueprint defaults.
6. Render with Copier into the requested destination:

   ```bash
   copier copy --data-file ANSWERS_FILE --vcs-ref BLUEPRINT_BRANCH \
     https://github.com/lesliebinbin/mise-blueprints.git DESTINATION
   ```

7. Confirm that no `.jinja` files or unresolved template expressions remain in
   the destination.
8. Run `mise install`, `mise setup`, and `mise check` in the generated project
   when those tasks exist.
9. Report the selected identifier, version, normalized answers, and validation
   result.

Do not modify a released blueprint version while generating a project. If the
template cannot represent a requirement, generate the closest valid baseline
and make the project-specific change only in the destination.
