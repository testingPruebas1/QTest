Feature: [FE] As a matchmaker, I need to see the NOTES for a Candidate

    As a matchmaker that is searching potentail matches for my member, I need to review the NOTES I have inputed for a candidate in the Candidate Profile Preview screen to have more information to determine if they are a good fit.

    Scenario: New Tab in Candidate Profile Preview Screen

        Given Matchmaker have logged in, creates and updates notes on a member.
        When Matchmaker navigates to Candidate Profile Preview screen, to have more information
        Then Matchmaker must see a new tab next to Match Preferences with NOTES for this specficic candidate. Containing just the existing notes.(AC#1)

        When Matchmaker displays the Subject.
        Then Matchmaker must see the date when it was created or updated, and who created/updated it, and the note.(AC#2)

        When Matchmaker see the notes
        Then he must see that the notes are arranged in descending chronological order, the newest notes will be shown above(AC#3)

        When another matchmaker creates a note on the same member
        Then matchmaker must see the changes with previous parameters (AC#4)