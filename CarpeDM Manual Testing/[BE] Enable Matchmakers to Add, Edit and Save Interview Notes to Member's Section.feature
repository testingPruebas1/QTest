Feature: Allow matchmakers to add, edit and save interview notes in the members section

# Admin User Responds to Questions in Different Sections

  Scenario: Admin user responds to questions in different sections
    Given that the admin user is in the questions section
    When the admin user answers the first question as a note
    Then the response is saved correctly as a note in the first section
    And the admin user sees the "Next" button
    
    When the admin user clicks on the "Next" button
    Then the admin user is taken to the next question
    And the admin user can answer the second question as a note
    And the response is saved correctly as a note in the second section
    And the admin user sees both "Previous" and "Next" buttons

  Scenario: Admin user saves a note for the entire interview
    Given that the admin user has completed all interview sections
    When the admin user finishes the interview
    Then a note for the entire interview is saved in the user's profile with the subject "Interview Incorporation"

  Scenario: Admin user goes back to previous questions to modify responses
    Given that the admin user is in the questions section
    When the admin user answers the first question and moves to the second question
    And then the admin user goes back to the first question
    Then the admin user can view and modify the response saved in the first question

# System Stores and Retrieves Notes for Interview Sections

  Scenario: System stores and retrieves notes for each interview section
    Given that the admin user is in an interview
    When the admin user answers questions in different sections
    And the system stores the notes of each section as variables in a temporary collection
    Then the backend can retrieve and update the notes based on the admin user's navigation

  Scenario: System stores room ID to identify each interview
    Given that the admin user is in an interview
    When a new interview is initiated
    Then the backend can store the room ID to identify each interview

# System Ensures Data Recovery in Case of Disconnection

  Scenario: System ensures recovery of notes in case of disconnection
    Given that the admin user is in an interview
    When the admin user answers questions and suddenly loses connection
    Then the system saves the notes for each section and the room ID
    And the frontend application can retrieve this information to restore previously entered notes
