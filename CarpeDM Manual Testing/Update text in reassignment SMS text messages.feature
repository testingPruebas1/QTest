Feature: Update text in reassignment SMS text messages
  The message that reaches the matchmaker
  After a rootadmin, admin or matchmaker reassigns an interview from the Admin Portal
  It must be updated with a new one
  
Scenario: (AC#1 AC#2) The message that is sent to the matchmaker after a rootadmin, admin, or matchmaker reassigns an interview should be updated by a new message
  Given that the rootadmin, admin or matchmaker reassigns an interview from the "Personal" or "Global" calendar view to a new matchmaker
  Then an SMS message will be sent via Twilio to the new matchmaker in the following format: "Hi [Matchmaker First Name], [Member First and Last Name] has been reassigned to you. You have a new member interview scheduled on Month Day at XX :XX [am/pm] EST"
  And an email arrives to the user of the Registration Web Portal with the details of the new interview
  
Scenario: (AC#1 AC#2) The message that is sent to the matchmaker after a root admin, admin, or matchmaker reassigns an interview with their synced Google account should be updated with a new message
  Given that the rootadmin, admin or matchmaker has your Google account "Synchronized"
  And reassign an interview from the "Personal" or "Global" calendar view to a new matchmaker
  Then an SMS message will be sent via Twilio to the new matchmaker in the following format: "Hi [Matchmaker First Name], [Member First and Last Name] has been reassigned to you. You have a new member interview scheduled on Month Day at XX :XX [am/pm] EST"
  And an email arrives to the user of the Registration Web Portal with the details of the new interview