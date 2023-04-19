Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED

  Scenario: Implement using a new cron job to update user status to BCKCOMPLETED
    When the webhook is executed with the following parameters:
      | caseStatusId | Completed |
      | secondaryStatusId | null |
    Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

  Scenario: Implement the use of a new cron job to update the user status to BCKCOMPLETED
    When the webhook is executed with the following parameters:
      | caseStatusId | Adjudicated |
      | resultTypeId | Placed |
    Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

  Scenario: Implement the use of a new cron job to update the user status to BCKREJECTED
    When the webhook is executed with the following parameters:
      | caseStatusId | Adjudicated |
      | resultTypeId | Adverse Action |
    Then the user's profile status will be updated to "BCKREJECTED" in the user object

  Scenario: Update BackgroundCheck collection with "CompletedNeedReview" value if secondaryStatusId is "Consider"
    When the KC webhook has the following parameters:
      | caseStatusId | Completed |
      | secondaryStatusId | Consider |
    Then a record is created in the BackgroundCheck collection with the "status" field and the "CompletedNeedReview" value.
