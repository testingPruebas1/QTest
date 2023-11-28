Feature: Admin Portal Membership Tracking

          Scenario: Add a new item to the secondary menu to keep track of paused members
            Given that the administrator user is in the Administration Portal
            Then the secondary menu on the right side of the screen should include a new “Members on Pause” item.

          Scenario: View the list of paused members from the secondary menu
            Since the matchmaker is in the Admin Portal
            When the matchmaker clicks on the "Members on pause" item in the secondary menu
            Then a list of members with membership status "On Pause" should be displayed.
            And the list must include the following details:
              | Member name | Membership Pause Start Date | Number of days on pause |
              | Juan Perez  | 2022-03-15                  | 30                      |
              | Jane Smith  | 2022-04-20                  | 15                      |
            When the matchmaker clicks on a user's name in the list
            Then the user profile should open in a new tab.
            And admin users with role "id": "3" "AdminUser" (Matchmaker) will see only the active members assigned to them.
            And roles "1" and "2" will see all active members on pause listed.