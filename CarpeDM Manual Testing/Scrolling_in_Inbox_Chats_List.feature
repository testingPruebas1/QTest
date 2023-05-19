Feature: Scrolling in Inbox Chats List

Scenario: Displaying only existing conversations after scrolling in the chats list
  Given the Admin user has multiple existing conversations
  When the Admin user goes to the Inbox
  And the Admin user scrolls down the conversations
  Then only the existing conversations should be listed

Scenario: Contacts should not be listed after scrolling in the chats list
  Given the Admin user has multiple existing conversations
  When the Admin user goes to the Inbox
  And the Admin user scrolls down the conversations
  Then the contacts should not be listed

Scenario: Number of conversations listed should match the existing conversations count
  Given the Admin user has multiple existing conversations
  When the Admin user goes to the Inbox
  Then the number of conversations listed should match the count of existing conversations

Scenario: Displaying additional conversations after scrolling beyond the existing conversations
  Given the Admin user has multiple existing conversations
  When the Admin user goes to the Inbox
  And the Admin user scrolls down beyond the existing conversations
  Then additional conversations should not be listed