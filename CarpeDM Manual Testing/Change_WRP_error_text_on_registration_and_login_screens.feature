Feature: Change WRP error text on registration and login screens

       On the endpoints "api/Auth/IsEmailAvailable/{email}" and "get-tempcode"
       isDeleted = true
       Change the error text

    Scenario: (AC#1) During the registration process, change the error text to a new one

        When the WRP user tries to create an account with an existing email in the database with the field "IsDeleted" = true
        And the user enters the email and clicks CONTINUE
        Then user will see an error: "This email address is not authorized to access this site. Contact ask@carpedmdating.com for support."
    
    Scenario: (AC#2) During the login process, change the error text to a new one

        When the WRP user tries to login with an existing email in the database with the field "IsDeleted" = true
        And the user enters the email and clicks CONTINUE
        Then user will see an error: "This email address is not authorized to access this site. Contact ask@carpedmdating.com for support."

    Scenario: During the registration process, you should get an error message

       When the WRP user tries to create an account with an existing email in the database with the field "IsDeleted" = false
       And the user enters the email and clicks CONTINUE
       Then the message "Sign up Error! An account linked to this email already exists. Enter another email or log in."

    Scenario: During the login process, you should not get any error message

       When the WRP user tries to login with an existing email in the database with the field "IsDeleted" = true
       And the user enters the email and clicks CONTINUE
       Then user will then see the "Please verify it is you." Code Verification screen.