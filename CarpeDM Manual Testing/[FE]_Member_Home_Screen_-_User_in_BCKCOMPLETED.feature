Feature: [FE] Member Home Screen - User in BCKCOMPLETED

    Given that the Active Member is Logged into the WRP, then they will see the following Home screen


    Scenario: (#1) Desktop look and feel
        Given the Active Member is Logged into the WRP, on desktop version
        When he navigates to Home screen
        Then he see the same look and feel as in the mockup

    Scenario: (#2) Mobile look and feel
        Given the Active Member is Logged into the WRP, on mobile version
        When he navigates to Home screen
        Then he see the same look and feel as in the mockup

    Scenario: (#3) Membership Type & Renewal Date
        Given the Active Member is Logged into the WRP
        When he navigates to Home screen
        Then he see Display Membership Type & Renewal Date: “Your [Premium] Subscription will auto renew on [Date].”

    Scenario: (#4) "Carpe Social" redirection
        Given the Active Member is Logged into the WRP
        When he clicks on "Social" option (!)
        Then he is redirected to 'https://carpedmdating.com/carpe-social/'

    Scenario: (#5) “Black Women Deserve” redirection
        Given the Active Member is Logged into the WRP
        When he clicks on "Black Women Deserve" option
        Then he is redirected to 'https://carpedmdating.com/black-women-deserve/'

    Scenario: (#6) “Community Guidelines” redirection
        Given the Active Member is Logged into the WRP, and navigates to Legal screen
        When he clicks on "Community Guidelines" option
        Then he is redirected to 'https://register-qa.carpedmdating.com/dashboard/legal', on Community Guidelines

    Scenario: (#7) "Donation Partners" redirection
        Given the Active Member is Logged into the WRP
        When he clicks on "Donation Partners" option
        Then he is redirected to 'https://carpedmdating.com/we-give-black/'

    Scenario: (#8) “Terms of Use” redirection
        Given the Active Member is Logged into the WRP, and navigates to Legal screen
        When he clicks on "Terms of Use" option 
        Then he is redirected to 'https://register-qa.carpedmdating.com/dashboard/legal', on Terms of Use

    Scenario: (#9) “FAQs” redirection
        Given the Active Member is Logged into the WRP
        When he clicks on "FAQs" option
        Then he is redirected to 'https://carpedmdating.com/faqs/'

    Scenario: (#10) Responsive
        Given the Active Member is Logged into the WRP
        When he runs all previous scenarios
        Then he see that design is responsive