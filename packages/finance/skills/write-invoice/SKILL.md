---
name: write-invoice
description: Generates a document invoice for a client - (1) Uses XLSX template format to input information (2) Transforms XLSX into PDF format
---

# Generate Invoice
Auto Generates Invoice for a client in XLSX format and converts to PDF format.  Both formats are exported and saved.

## Workflow Instructions
Use the `AskUserQuestions` tool to gather or confirm information for the invoice generation when uncertain.
1. Active Project Name
2. Name: Reference the Bio file
3. Client Name and Address: Reference the Client file
4. Date and Date Span of Work
5. Billable for Client: As Y/N, default is N
5. Hourly Rate: Ask for Hourly Rate

### Input Format
Only perform the following sequences of Steps:
1. Copy the template file within @references/{name}_{client}_{date}.xlsx
2. The Date to be used should always be on a Friday at the end of the week

### Output Format
- Save Files in active project: stores/artifactlib/{project_name}/{filename}
