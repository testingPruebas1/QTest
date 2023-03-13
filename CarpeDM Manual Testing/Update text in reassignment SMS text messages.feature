Feature: Update text in reassignment SMS text messages
  The message that reaches the matchmaker
  After a rootadmin, admin or matchmaker reassigns an interview from the Admin Portal
  It must be updated with a new one
  
Scenario: (AC#1 AC#2) The message that is sent to the matchmaker after a rootadmin, admin, or matchmaker reassigns an interview should be updated by a new message
  Given that the rootadmin, admin or matchmaker reassigns an interview from the "Personal" or "Global" calendar view to a new matchmaker
  Then a SMS message via twilio will be sent to the new matchmaker