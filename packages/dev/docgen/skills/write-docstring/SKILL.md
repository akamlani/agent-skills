---
name: write-docstring
description: "Guide users through a structured workflow for writing clear and effective docstrings. Use when the user needs to create or update docstrings for functions, classes, or modules before publishing code.  Trigger on phrases like 'document code', 'write docstring', 'create docstring', 'update docstring', or similar."
---

# Docstring Generator
This skill adds docstrings to every public class, method, and function in a Python package (and all its subpackages), updating existing docstrings where they are incomplete or malformed.  It shall also update examples, tests, and applications.

## Workflow
Use `AskUserQuestions` tool to clarify any information needed from the User.

1. Identify Docstring Style Format: Use `google` by default
2. Locate the Package based on `pyproject.toml` file
3. Scan and Analyze Codebase for all public classes, methods, and functions
4. Process each file iteratively, generating or updating docstrings per guidelines as needed
5. Perform Validations on Existing Docstrings for Completeness and Well-Formedness
6. Report a Tabular Summary of Changes Made, including any files that were skipped due to errors or issues


### Guidelines
Reference `@stores/contextlib/_rules/styles/styling-python.md` for general python style conventions
- Preserve the original indentation. Match the surrounding code style (spaces vs tabs).
- Avoid trying to be verbose or include unnecessary information. Focus on clarity and usefulness.

Furthermore, follow these specific guidelines for docstring generation:
- **First line**: one sentence, imperative mood, ends with period.
- **Body paragraph** (if needed): expand on behaviour, edge cases, side effects.
- **Args**: describe defaults, purpose, constraints, not just type.
- **Returns**: describe the structure and meaning of the return value, not just its type.
- **Raises**: include only documented/expected exceptions, not every possible Python error.
- **Example**: include examples of call usage and potential workflow where beneficial for clarity.
  - Examples should be included when clarity is required or to demonstrate workflows, but not for simple cases.
  - Ensure examples represent realistic representative cases as well as relative to aligned user preferences.

### Validations
- [ ] PEP 257 Compliance: Ensure all docstrings adhere to PEP 257 conventions for docstring for `google`
- [ ] Completeness: All public classes, methods, and functions should have function signature docstrings