Feature: As an admin, rootadmin or matchmaker I should not be able to send messages to all members in the pool

     From now on, only users who are type 1 and the status is 'PAID'
     Or Type 2 and 3 will be displayed in the contact search process

     Scenario: As an admin, rootadmin or matchmaker, you can only send messages to your members
         Given 'Admin' is found on the '/Inbox' page
         When 'Admin' selects the 'My Members' filter
         Then the active members assigned to 'Admin' are listed
         And and other users who are not members of 'Admin' are not listed

     Scenario: As an admin, rootadmin or matchmaker, you can send messages to other admins, rootadmins or matchmakers
         Given 'Admin' is found on the '/Inbox' page
         When 'Admin' selects the 'Admin & Matchmakers' filter
         Then all admins, rootadmins and matchmakers are listed (Type: 2, Type: 3)