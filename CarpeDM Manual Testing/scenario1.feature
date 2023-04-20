Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED.

Scenario Outline: (#1) Implement using a new cron job to update user status to BCKCOMPLETED.
        Given the user is in "BCKINIT" status.
        When the webhook is executed with the following parameters:
            | id                | caseId    |
            | caseStatusId      | Completed |
            | secondaryStatusId | null      |
        Then the user's profile status will be updated to "BCKCOMPLETED" in the user object.
        And the "Status" field in the user's BackgroundCheck object will be updated from "CaseCreated" to "Complete".
        
        Examples:
            | status         | id                                   |

            | Completed      | 22334455-937e-46b1-8799-887766554433 |
