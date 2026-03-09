# Structured Output


```python
import  pandas as pd
from    pydantic import BaseModel, Field, Annotated
from    enum     import StrEnum, auto
from    typing   import List

class Enrichment(BaseModel):
    class Topic(BaseModel):
        subject:        Annotated[str, Field(..., description="The main subject or theme of the text")]
        tags:           Annotated[List[str], Field(..., description="List of relevant tags or keywords associated with the text")]
    class Concept(BaseModel):
        name:           Annotated[str, Field(..., description="Name of the concept or entity identified in the text")]
        principle:      Annotated[str, Field(..., description="The main principle or idea conveyed in the text")]
        category:       Annotated[str, Field(..., description="Category or type of the concept, e.g., 'Person', 'Organization', 'Location', etc.")]
        associations:   Annotated[List[str], Field(..., description="List of related concepts or entities associated with the main principle")]
    class Insight(BaseModel):
        observation:    Annotated[str, Field(..., description="A key observation or insight derived")]
        period:         Annotated[str, Field(..., description="The time period or context in which the observation is relevant")]
        highlights:     Annotated[List[str], Field(..., description="Key highlights or findings derived")]
        actions:        Annotated[List[str], Field(..., description="Recommended actions or next steps based on the insights derived")]
        failures:       Annotated[List[str], Field(..., description="List of potential failure points or risks associated with the insights or actions derived")]
        rca:            Annotated[str, Field(..., description="Root Cause Analysis explaining the underlying reasons for the observations or insights derived")]

    keywords:   Annotated[List[str], Field(..., description="List of keywords extracted")]
    topics:     Annotated[List[Topic], Field(..., description="List of main topics identified")]
    concepts:   Annotated[List[Concept], Field(..., description="List of key concepts, entities, relationships identified")]
    insights:   Annotated[List[Insight], Field(..., description="List of insights derived")]

class ActionItem(BaseModel):
    """An action item extracted from the context"""
    task:     Annotated[str, Field(description="The task to be done")]
    assignee: Annotated[str, Field(description="Person responsible")]
    due_date: Annotated[str, Field(description="Due date if mentioned, otherwise 'TBD'")]

class Document(BaseModel):
    """Structured Output of Document"""
    title:          Annotated[str, Field(description="Title or Topic")]
    key_decisions:  Annotated[List[str], Field(description="Key decisions made")]
    action_items:   Annotated[List[ActionItem], Field(description="Action items with assignees")]
    insights:       Annotated[Enrichments, Field(description="Insights Generation")]


# format the response
df_document = pd.DataFrame([doc.model_dump() for doc in document.action_items])
display(df_document)
```