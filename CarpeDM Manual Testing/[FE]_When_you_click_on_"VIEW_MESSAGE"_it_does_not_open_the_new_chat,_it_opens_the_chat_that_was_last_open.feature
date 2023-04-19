Feature: [FE] When you click on "VIEW MESSAGE" it does not open the new chat, it opens the chat that was last open

    As a rootadmin, admin or matchmaker, when I receive an inbox message from another rootadmin, admin, matchmaker or user and I have another chat open, navigating to Home and clicking “VIEW MESSAGE” does not open the new chat but turns it back to open the chat that was previously open.

    Scenario: View message redirection

        Given Root Admin, Admin or Matchmaker have logged in
        And navigates to Inbox screen, selecting one chat

        When he navigates to Home screen and clicks "View Message" button, to see a new message recieved in another chat box
        Then he must be redirected to new chat screen, from he recieved the new message, not chat screen previously opened.