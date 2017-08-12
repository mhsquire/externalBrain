Feature: The program allows the user to delete a dup tag when going through files
  Description: The program allows the user to delete a dup tag after searching for similar files based on
  Name, Date, File Type, Hash, Location, Tags, Size


  Background:
    Given there are a list of files marked as duplicates
    And the associate program with the dupe tag flag is running

  Scenario:
    When the user selects any duplicate file
    Then the file and it's duplicates are shown

  Scenario:
    Given the only one set of duplicate files are shown
    When the user enters a comma delimited file selection
    Then the program removes the dup tay

  Scenario:
    Given the user selects any duplicate file
    And the user removes the dup tag from any number of them
    When the user clicks the apply button
    Then the list is updated
    And the database is updated