Feature: Match Expiration Notification

Scenario: User A receives match expiration notification when User B does not take action after QVC
Given User A StatusName is "RemainMatch" and IsSeizedByBothUsers is TRUE and CallInformation is DONE and QVCall is TRUE and IsRemainedByBothUsers is False
When 72 hours have passed after QVC
Then User A receives a push notification "InitialMatchReminder 2" (expired match)
And User B receives a Carousel notification with the title "Match Expired"