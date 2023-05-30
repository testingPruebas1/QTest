Feature: Match Expiration Notification

Scenario: User A receives match expiration notification when User B does not take action after QVC
Given User A StatusName is "RemainMatch" and IsSeizedByBothUsers is TRUE and CallInformation is DONE and QVCall is TRUE and IsRemainedByBothUsers is False
When 72 hours have passed after QVC
Then User A receives a push notification "InitialMatchReminder 2" (expired match)
And User A receives a Carousel notification with the title "Match Expired"

Scenario: User A's proposal disappears from matches without warning when they take action
Given User A performs an action
When the proposal disappears from User A's matches
Then User A should be notified about the reason for the proposal's disappearance

Scenario: Users are informed about changes in the application's profile
Given the application's profile has changed
Then users should be notified about the changes