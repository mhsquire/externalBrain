Feature: The program makes an index of the files in question on the system
  Description: Stores the name and location with tag data.

  Background:
    Given there are files to test

  Scenario:
    When the user tags a file
    Then the file is placed in the index

  Scenario:
    When the file is placed in the index
    Then the files metadata is saved in the database

  Scenario:
    Given that a file is in the index database
    Then the file can be accessed by the program