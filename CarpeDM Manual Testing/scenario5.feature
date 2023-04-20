Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED.


    Scenario Outline: (#5) Update BackgroundCheck collection with "CompletedNeedReview" value if secondaryStatusId is "Consider".
        Given the user is in "BCKINIT" status.
        When the KC webhook has the following parameters:
            | id                | caseId      |
            | caseStatusId      | Adjudicated |
            | resultTypeId      | Placed      |
            | secondaryStatusId | Consider    |
        Then the user profile state will still be "BCKINIT" on the user object.
        And the "Status" field in the user's BackgroundCheck object will be updated from "CaseCreated" to "CompletedNeedReview".
 
        Examples:
            | status         | id                                   |

            | Adjudicated    | 47463524-937e-46b1-8799-873f63e7b402 |
            | Placed         | bbbd9fa2-598f-43f6-8363-b8b55e7aa777 |
            | Consider       | status-type-consider                 |