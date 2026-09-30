---
description: Generates a Prompt based on User Criteria via Meta-Prompting
argument-hint: [task] [context]
---

# Prompt Generation
I want to use AI to help with: $ARGUMENTS

If no task was given, ask for one before continuing.
Ask the user for any additional information needed.

## Workflow
1. Gather the task and initial context
2. Ask 2-3 questions about the task to gather additional context
3. Ask which target model will run the prompt, and tailor length and format to it
4. Generate the initial prompt
5. Self-validate and determine whether any improvements can be made or refined
6. Provide the final response back to the user

At minimum, please use the following prompt framework:
```text
"You are a [Role], [Task Description] for [Context].
Please adhere to [List Specific Requirements].
Avoid [Boundaries].
Explain your Reasoning for [xx]."
```

### Constraints
Cover these six components of a good prompt:
1. **Role** — who the model should act as
2. **Task** — what exactly it should do
3. **Context** — the background needed to do it well
4. **Requirements** — specific rules, formats, and criteria to follow
5. **Boundaries** — what to avoid or leave out
6. **Reasoning** — what the model should explain or justify

Include any additional compounding benefits and improvements.

### Validation
- [ ] What exactly do I want? (e.g., Not "help with code" but "validate email function")
- [ ] How should it work?  (e.g., Return type, behavior, handling)
- [ ] Where does it apply? (e.g., Language, framework, file location)
- [ ] Why context matters? (e.g., Only if it affects the solution)

## Output Format
- The final prompt in a single fenced `text` block, ready to copy
- A 2-3 line note on what was refined during self-validation
