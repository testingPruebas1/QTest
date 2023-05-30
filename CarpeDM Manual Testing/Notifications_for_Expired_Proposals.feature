Feature: Notifications for Expired Proposals
  As a user receiving proposals from other users, 
  I need to know if the proposals 
  I've received are still active or if they have already expired. 
  So I would like to get notifications about my proposals until they expire. 
  Once they expire, I don't want to continue getting notifications anymore.

Scenario: Testing notifications for expired proposals
  Given I am registered and signed into the platform
  When I accept a proposal from another user
  And the proposal expires due to lack of response from the recipient
  Then I expect to receive notifications regarding the expiration of the proposal
  When I check my profile settings for email preferences
  And I confirm that I am opted out of receiving notifications for expired proposals
  Then I should stop receiving emails about the proposal that has already expired.