Feature: The user can choose to move the file
Description: The user can move the file to another loacation on computer

  Background:
  Given there are files to test

  Scenario:
    Given there are files that are tagged
    Then those tagged files can be moved to a location together

  Scenario:
    When the program flashes a file at the user
    Then the user can choose to move it to another location

  Scenario:
    When the user moves a file that is in the index
    Then the file reference in the index is updated

  Scenario:
    When the program flashes a file at the user
    Then the user can send the file to a tagged group


