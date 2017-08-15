Feature: files can be added to the main collection list by location
  Description: files can be added to the main collection list by adding locations from which recursion is used to add
  all the files in the various directories.

  Background:
    Given there are files to test

  Scenario:
    When the user types in a location into the textfield
    And the user clicks the add button
    Then the location is added to the location list

  Scenario:
    Given the text box is empty
    When the user clicks the add button
    Then the directory chooser is launched

  Scenario:
    Given the text box is empty
    And the user clicks the add button
    When the directory chooser is launched
    And the user chooses a directory
    Then the location of the directory is added to the location list

  Scenario:
    When the user adds a string to the text field
    And clicks the add button
    Then it is checked to make sure it is a valid file path