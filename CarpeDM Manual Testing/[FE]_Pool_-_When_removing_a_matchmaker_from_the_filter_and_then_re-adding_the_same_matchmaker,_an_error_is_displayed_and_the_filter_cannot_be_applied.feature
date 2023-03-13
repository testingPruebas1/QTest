Feature: [FE] Pool - When removing a matchmaker from the filter and then re-adding the same matchmaker, an error is displayed and the filter cannot be applied

    When removing a matchmaker from the filter and then re-adding the same matchmaker, the error message, “The user has already been selected” appears even though the matchmaker is not in the Applied Filters.

Scenario: Repeat pre selected and erased Matchmaker

Given Admin navigates to "Pool" screen

When Admin selects "Matchmaker" option, in primary filter tab, clicks on one matchmaker

And cancel that same matchmaker, and search him again and selects it

Then Admin must can select this admin again.


Scenario: Select a previously matchmaker, when he was negated

Given Admin navigates to "Pool" screen, selects "Matchmaker" option, in primary filter tab, clicks on one matchmaker

When Admin search and selects him again, and the error message is displayed.

And Admin cancels this admin, and tries to select him again.

Then Admin must can select the matchmaker again.