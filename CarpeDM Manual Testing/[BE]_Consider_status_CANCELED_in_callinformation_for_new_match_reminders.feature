Feature: [BE] Consider status CANCELED in callinformation for new_match_reminders 

    36 hours after match created, with CallStatusName:CANCELED

 Scenario: CallStatusName:CANCELED after 36 hours
  Given matchmaker creates a new match between User A and User B
  And User match object for boths users in Status name: SeizedMatch 
  And IsSeizedByBothUsers in TRUE 
  And CallStatusName:CANCELED 
  And InitialMatchExpires is greater than current date|time

  When 36 hours after match is created
  And system checks Match Statusname, the flag IsSeizedByBothUsers, the CallInformation and the InitialMatchExpires less than current date|time.

  Then The event new_match_reminder_36 is triggered in Braze for both User A and B (AC#1)

  Then User A receives a push notification “new_match_reminder_36” (AC#2)

  Then User B receives a push notification “new_match_reminder_36” (AC#3)