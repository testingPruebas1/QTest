Feature: [BE] Move the Braze user/delete endpoint call to when users are hard deleted

    Feature Currently, the endpoint /User/delete-profile/ that we are using to soft-delete the user account is also deleting the user in Braze.

    Requirement: move the Braze user/delete endpoint call to when users are hard deleted.

    Scenario: (AC#1) Soft-delete and user_delete_application in Braze

        Given User clicks on “Delete Account” in the Account Settings screen, confirms the pop-up and selects a deletion reason
        When User checks his ID on Braze
        Then User must see that he is not deleted and should see the braze custom event  user_delete_application in Braze and the email is received by the user.

    Scenario: (AC#2) Hard-delete automatic process and Braze

        Given the automatic process runs to hard delete the account
        When User checks for his account on Braze
        Then User must see that user is braze is also deleted