Feature: [BE] the Initialdates-get is returning expired matches

    

    Scenario: (#1) Only expired matches

        Given User only have expired matches
        When User runs /api/Match/initialdates-get
        Then User see a "400" response with the message: "No initial dates available"

    Scenario: (#2) Expired and Seized matches

        Given User have expired and seized matches
        When User runs /api/Match/initialdates-get
        Then User see a "200" response with seized match in the body