---
description:   Generates a Prompt based on User Criteria via Meta-Prompting
argument-hint: [task] [context]
---

# Prompt Generation
I want to use AI to help [insert task and add in some context].
Use the `AskUserQuestions` tool to gather additional information from user.

## Workflow
1. Gather Task information and Initial Context
2. Ask 2-3 questions about the task to gather addition context
3. Identify which LLM will be used to optimize the task
4. Generate Initial Prompt
5. Self-Validate and determine if any approvments can be made or refined
6. Provide final response back to User

At minimum, Please use the follwoing prompt framework:
```text
"You are a [Role], [Task Description] for [Context].
Please adhere to [List Specific Requirements].
Avoid [Boundaries].
Explain your Reasoning for [xx]."
```

### Constraints
Use the following constraint boundary guidelines:
- Use the identified six (6) components of a good prompt
- Include any additional compounding benefits and improvmeents

### Validation
- [ ] What exactly do I want? (e.g., Not "help with code" but "validate email function")
- [ ] How should it work?  (e.g., Return type, behavior, handling)
- [ ] Where does it apply? (e.g., Language, framework, file location)
- [ ] Why context matters? (e.g., Only if it affects the solution)