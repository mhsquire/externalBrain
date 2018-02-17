Feature: The user can choose to tag the file
Description: When the program flashes a file the user can tag it with as many new tags as they want.

  Background:
    Given there are files to test
    And there are files in the queue
    And there is a file being shown


  Scenario:
    Then the user can add a tag to the tag box

  Scenario:
    When the program flashes a file
    Then the user can remove a tag from the tag box

  Scenario:
    Given there are tags added by the user
    When the user clicks the apply button
    Then the program replaces the files tags with those in the tag box