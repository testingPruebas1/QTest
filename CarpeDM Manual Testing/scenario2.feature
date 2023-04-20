Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED.

Scenario Outline: (#2) Implement the use of a new cron job to update the user status to BCKCOMPLETED.
        Given the user is in "BCKINIT" status.
        When the webhook is executed with the following parameters:
            | id           | caseId      |
            | caseStatusId | Adjudicated |
            | resultTypeId | Placed      |
        Then the user's profile status will be updated to "BCKCOMPLETED" in the user object.
        And the "Status" field in the user's BackgroundCheck object will be updated from "CaseCreated" to "Complete".

        Examples:
            | status         | id                                   |

            | Adjudicated    | 47463524-937e-46b1-8799-873f63e7b402 |
            | Placed         | bbbd9fa2-598f-43f6-8363-b8b55e7aa777 |