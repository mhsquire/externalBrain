Feature: The user can choose to move the file
Description: The user can move the file to another location on computer

  Background:
  Given there are files to test
    And there are files in the queue
    And there is a file being shown


  Scenario:
    Then the user can choose to move the file to another location

  Scenario:
    When the user moves a file that is in the database
    Then the file reference in the database is updated

  Scenario:
    When the program flashes a file at the user
    Then the user can send the file to a tagged group location


