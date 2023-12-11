Feature: Background check status update

  Scenario: Update background check status to "Background check initiated"
    Given the Karmacheck Status field values are as follows:
      | caseStatusId | secondaryStatusId |
      | d894b8a0-937e-46b1-8799-15bad611844f | null |
    When the system receives this status via the webhook
    Then the BackgroundCheck.Status should change from "CaseCreated" to "Background check initiated"
    And the field IsBackGroundCheckInitiated in the user object should be updated to true

  Scenario: Update background check status to "Initiated - Waiting for Authorization"
    Given the Karmacheck Status field values are as follows:
      | caseStatusId | secondaryStatusId |
      | d894b8a0-937e-46b1-8799-15bad611844f | Waiting for Authorization |
    When the system receives this status via the webhook
    Then the BackgroundCheck.Status should change to "Initiated - Waiting for Authorization"

  Scenario: Update background check status to "Initiated - Authorization in Progress"
    Given the Karmacheck Status field values are as follows:
      | caseStatusId | secondaryStatusId |
      | d894b8a0-937e-46b1-8799-15bad611844f | Authorization in Progress |
    When the system receives this status via the webhook
    Then the BackgroundCheck.Status should change to "Initiated - Authorization in Progress"