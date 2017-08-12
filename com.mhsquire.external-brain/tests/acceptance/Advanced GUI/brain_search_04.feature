Feature: The user can choose to tag the file
Description: When the program flashes a file or the user right clicks on a file the user can tag it.

  Background:
    Given there are files to test

  Scenario:
    When the program flashes a file
    Then the user can add a tag to a file

  Scenario:
    When the user right clicks on a file
    Then the user can add a tag to a file

  Scenario:
    When the program flashes a file
    Then the user can remove a tag from a file

  Scenario:
    When the user right clicks on a file
    Then the user can remove a tag from a file
