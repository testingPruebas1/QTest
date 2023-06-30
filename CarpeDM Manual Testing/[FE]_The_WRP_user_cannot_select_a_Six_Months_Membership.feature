Feature: [FE] The WRP user cannot select a Six Months Membership

    Root cause: the FE executes the endpoint /api/Portal/add-payment-info and the endpoint /api/Portal/update-membership, to save the Membershio object inside the user object. 

    During this process, the BE needs to get the # of matches that includes a membership, and this match is done using the Membership type. If the BE cannot find the same Membership type (string) in stripe, then it returns an error and the membersjip information cannot be saved. 

    DEV Task: Add # matches included in a Membership as a metadata in Stripe

    Scenario: (#1) Only the membership with metadata Available=TRUE  must be displayed in the FE - Membership screen (according to the mediagender)

        Given user is gender female 
        And changes metadata Available=TRUE to FALSE to different membership types
        Then user see only  membership types Available=TRUE on FE

        Given user is gender male 
        And changes metadata Available=TRUE to FALSE to different membership types
        Then user see only  membership types Available=TRUE on FE

    Scenario: (#2) WRP users must be able to select any of the memberships listed in the Membership Screen. 

        Given user logs in
        When he navigates to  Membership screen
        Then user is able to select any of the memberships listed in the Membership Screen

    Scenario: (#3) All the fields in the Membership objects and payment object must be updated correctly. 

        Given user changes the fields in the Membership objects and payment object
        When user navigates to Membership screen
        Then user see that objects are updated correctly. 