Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED.

Scenario Outline: (#3) Implement the use of a new cron job to update the user status to BCKREJECTED.
        Given the user is in "BCKINIT" status.
        When the webhook is executed with the following parameters:
            | id           | caseId         |
            | caseStatusId | Adjudicated    |
            | resultTypeId | Adverse Action |
        Then the user's profile status will be updated to "BCKREJECTED" in the user object.
        And the "Status" field in the user's BackgroundCheck object will be updated from "CaseCreated" to "Complete".
        
        Examples:
            | status         | id                                   |

            | Adjudicated    | 47463524-937e-46b1-8799-873f63e7b402 |
            | Adverse Action | d082a629-5dff-4303-83ae-897776ebcb17 |
