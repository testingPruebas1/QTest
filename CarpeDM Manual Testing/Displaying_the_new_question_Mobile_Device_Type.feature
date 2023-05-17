Feature: Displaying the new question Mobile Device Type

Scenario: Displaying the new question Mobile Device Type at the end
  Given the WRP user is answering the questionnaire
  Then the new question Mobile Device Type must be displayed at the end

Scenario: Displaying the photo in the banner based on User.MediaMender
  Given the WRP user is answering the questionnaire
  Then the photo in the banner must be displayed based on the User.MediaGender

Scenario: Displaying the options for the question Mobile Device Type
  Given the user is answering this question Mobile Device Type
  Then they will see 3 buttons: Android, Iphone, Other

Scenario: Saving the answer when the user clicks on Android
  Given the user has clicked on Android
  Then the answer will be saved in the user object

Scenario: Saving the answer when the user clicks on Iphone
  Given the user has clicked on Iphone
  Then the answer will be saved in the user object

Scenario: Saving the answer when the user clicks on Other
  Given the user has clicked on Other
  Then the answer will be saved in the user object

Scenario: User can select only one answer option
  Given the user is answering this question Mobile Device Type
  Then they can only select one answer option

Scenario: User can skip the question
  Given the user is answering this question Mobile Device Type
  When they skip the question
  Then no answer will be saved in the database

Scenario: Adjusting the progress bar
  Given the user is answering the questionnaire
  Then the progress bar must be adjusted to reflect one additional question
  And the progress bar will have 7 points

Scenario: Reflecting the new question in percentage completion and progress chart
  Given the user is on the home screen
  Then the percentage displayed next to "Answer Questionnaire" must reflect the new question
  And the progress chart must reflect the new question
  But if the new question has not been answered
  Then the questionnaire section will not be 100% completed
  And the chart will not show 100%