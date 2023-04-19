Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED

  Scenario Outline: Implement using a new cron job to update user status to BCKCOMPLETED
    When the webhook is executed with the following parameters:
      | caseStatusId | Completed |
      | secondaryStatusId | null |
    Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

  Scenario Outline: Implement the use of a new cron job to update the user status to BCKCOMPLETED
    When the webhook is executed with the following parameters:
      | caseStatusId | Adjudicated |
      | resultTypeId | Placed |
    Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

  Scenario Outline: Implement the use of a new cron job to update the user status to BCKREJECTED
    When the webhook is executed with the following parameters:
      | caseStatusId | Adjudicated |
      | resultTypeId | Adverse Action |
    Then the user's profile status will be updated to "BCKREJECTED" in the user object

  Scenario Outline: Update BackgroundCheck collection with "CompletedNeedReview" value if secondaryStatusId is "Consider"
    When the KC webhook has the following parameters:
      | caseStatusId | Completed |
      | secondaryStatusId | Consider |
    Then a record is created in the BackgroundCheck collection with the "status" field and the "CompletedNeedReview" value.

Examples:
  | status        | uuid                                      |
  | Completed     | 22334455-937e-46b1-8799-887766554433       |
  | Adjudicated   | 47463524-937e-46b1-8799-873f63e7b402       |
  | Placed        | bbbd9fa2-598f-43f6-8363-b8b55e7aa777       |
  | Adverse Action| d082a629-5dff-4303-83ae-897776ebcb17       |
  | Consider      | f657c777-c38d-489b-ac26-dd9bf0a88724       |
