Feature: [MP] Only active WRP/User accounts can do login into the Member portal

    Only users with the following User Type, Status, Role can log into to the member portal:
    "type": 1,
    "status": 1,
    IsDeleted: FALSE
    "roles": [
    {
    "id": "4",
    "name": "User"
    },

    If the user does not meet those condition, then an error message will be displayed: This email address is not authorized to access this site. Contact ask@carpedmdating.com for support.

    Scenario: (#1) "type": 1, "status": 1, IsDeleted: FALSE, "roles": {"id": "4","name": "User"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must logs in

    Scenario: (#2) "type": 2, "status": 1, IsDeleted: FALSE, "roles": {"id": "4","name": "User"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in

    Scenario: (#3) "type": 3, "status": 1, IsDeleted: FALSE, "roles": {"id": "4","name": "User"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in

    Scenario: (#4) "type": 1, "status": 1, IsDeleted: FALSE, "roles": {"id": "1","name": "RootAdmin"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in

    Scenario: (#5) "type": 1, "status": 1, IsDeleted: FALSE, "roles": {"id": "2","name": "Admin"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in

    Scenario: (#5) "type": 1, "status": 1, IsDeleted: FALSE, "roles": {"id": "3","name": "AdminUser"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in

    Scenario: (#6) "type": 1, "status": 1, IsDeleted: TRUE, "roles": {"id": "4","name": "User"}

        Given User have the requirements descripted in Scenario's title
        When User tries to log in
        Then User must not logs in
