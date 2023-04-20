Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED.

Scenario Outline: (#4) Update BackgroundCheck collection with "CompletedNeedReview" value if secondaryStatusId is "Consider".
        Given the user is in "BCKINIT" status.
        When the KC webhook has the following parameters:
            | id                | caseId    |
            | caseStatusId      | Completed |
            | secondaryCaseStatusId | Consider  |
        Then the user profile state will still be "BCKINIT" on the user object.
        And the "Status" field in the user's BackgroundCheck object will be updated from "CaseCreated" to "CompletedNeedReview".

        Examples:
            | status         | id                                   |

            | Completed      | 22334455-937e-46b1-8799-887766554433 |
            | Consider       | status-type-consider                 |