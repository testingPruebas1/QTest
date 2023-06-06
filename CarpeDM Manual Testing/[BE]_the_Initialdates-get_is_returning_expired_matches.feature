Feature: [BE] the Initialdates-get is returning expired matches

    

    Scenario: (#1) NOT Return expired matches

        Given User only have matches in Initial Match (SeizedMatch and IsSeizedByBothUser=TRUE) that have already expired
        When User runs /api/Match/initialdates-get
        Then User see a "400" response with the message: "No initial dates available"

    Scenario: (#2) Expired and Seized matches
        Given User have matches in Initial Match that have NOT expired
        When User runs /api/Match/initialdates-get
        Then User see a "200" response with seized match in the body
        
    Scenario: (#3) Pending non-expired Seize Matches
      Given User have matches in status RemainMatch that have NOT expired
        When User runs /api/Match/initialdates-get
        Then User see a "200" response with seized match in the body
        
    Scenario: (#4) Pending non-expired Seize Matches
        Given User have matches in status RemainMatch that has already expired
        And the other match has not decided yet (the other object is in SeizedMatch and IsSeizedBYBothUsers=TRUE)
        When User runs /api/Match/initialdates-get
        Then this match must not be listed on the response