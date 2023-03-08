Feature: As admin, rootadmin or matchmaker you should not be able to message all active members

       From now on, only users who are type 1 and the status is 'PAID' and are assigned to me (MyMembers)
       As well as type 2 and 3 users will appear in the search process.

       Scenario: As an admin, rootadmin or matchmaker, you can only send messages to your members
           Given 'Admin' is on the '/Inbox' page
           When 'Admin' selects the 'My members' filter
           Then Active members assigned to 'Admin' are then listed
           And other users who are not members of 'Administrator' do not appear in the list

       Scenario: As an admin, root admin, or matchmaker, you can send messages to other admins, root admins, or matchmakers
           Given 'Admin' is on the '/Inbox' page
           When 'Admin' selects the 'Admin & Matchmakers' filter
           Then all admins, rootadmins and matchmakers are listed (Type: 2, Type: 3)

       Scenario: As an admin, root admin or matchmaker, you can send messages to other admins, root admins or matchmakers and their members
           Given 'Admin' is on the '/Inbox' page
           When 'Administrator' does not select any filters
           Then Active members assigned to 'Admin' are listed
           And all admins, rootadmins and matchmakers are also listed (Type: 2, Type: 3)

       Scenario: As an admin, rootadmin, matchmaker, you cannot search for an active member other than your member
           Given 'Admin' is on the '/Inbox' page
           When 'Admin' selects the 'My members' filter
           And 'Administrator' select the filter 'Administrator and Matchmakers'
           And 'Admin' writes the name of a user who does not belong to its members
           Then a text appears indicating that there is no result with that search