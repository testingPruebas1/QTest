Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED
  
  Replace the current cron job that updates the status to BCKCOMPLETED or BCKREJECTED
  Getting started with the KC webhook

  Scenario: Implement the use of a new cron job to update the user status to BCKCOMPLETED or BCKREJECTED in the CarpeDM database
    When running endpoint "https://api-stage.karmacheck.io/auth/api"
    And the endpoint "https://api-stage.karmacheck.io/case/id/{id}/action/place" is executed
    Then the caseID is updated in Karmacheck to the status "place" or "clear"
    And the Karmacheck system will execute the webhook to update the user's profile status to "BCKCOMPLETED"

  Scenario: Implement the use of a new cron job to update the user status to BCKCOMPLETED or BCKREJECTED in the CarpeDM database
    When running endpoint "https://api-stage.karmacheck.io/auth/api"
    And the endpoint "https://api-stage.karmacheck.io/case/id/{id}/action/preadverse" is executed
    Then the caseID is updated in Karmacheck to the status "adverse action"
    And the Karmacheck system will execute the webhook to update the user's profile status to "BCKREJECTED"
