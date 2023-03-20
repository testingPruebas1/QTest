Feature: CLONE - [BE] Braze custom event triggered when the Admin asks to AMEND the application

Scenario: AMEND notification   

Given that the Admin user has reviewed a new application and it needes to be AMENDed by the WRP user

When Admin user clicks on AMEND Profile button

Then the custom event profile_amend  must be triggered in Braze.