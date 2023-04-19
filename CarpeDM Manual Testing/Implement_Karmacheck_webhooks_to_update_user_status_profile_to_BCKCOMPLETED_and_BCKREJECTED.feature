Feature: Implement Karmacheck webhooks to update user status profile to BCKCOMPLETED and BCKREJECTED

    Replace the current cron job that updates the status to BCKCOMPLETED or BCKREJECTED
    Also start using the KC webhook

    Scenario: #1 Implement using a new cron job to update user status to BCKCOMPLETED
        When the webhook is executed with the following parameters: "caseStatusId": "Completed" and "secondaryStatusId": "null"
        Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

    Scenario: #2 Implement the use of a new cron job to update the user status to BCKCOMPLETED
        When the webhook is executed with the following parameters: "caseStatusId": "Adjudicated" and "resultTypeId": "Placed"
        Then the user's profile status will be updated to "BCKCOMPLETED" in the user object

    Scenario: #3 Implement the use of a new cron job to update the user status to BCKREJECTED
        When the webhook is executed with the following parameters: "caseStatusId": "Adjudicated" and "resultTypeId": "Adverse Action"
        Then the user's profile status will be updated to "BCKCOMPLETED" in the user object