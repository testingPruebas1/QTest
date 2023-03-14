Feature: Change WRP error text on registration and login screens

  On the endpoints "api/Auth/IsEmailAvailable/{email}" and "get-tempcode"
  If isDeleted = true
  Change the error text

  Scenario: (AC#1) During the registration process, change the error text to a new one

    When the WRP user tries to create an account with an existing email in the database with the field "IsDeleted" = true
    And the user enters the email and clicks CONTINUE
    Then user will then see an error: "This email address is not authorized to access this site. Please contact ask@carpedmdating.com for assistance."
    
  Scenario: (AC#2) During the login process, change the error text to a new one

    When the WRP user tries to create an account with an existing email in the database with the field "IsDeleted" = true
    And the user enters the email and clicks CONTINUE
    Then user will then see an error: "This email address is not authorized to access this site. Please contact ask@carpedmdating.com for assistance."