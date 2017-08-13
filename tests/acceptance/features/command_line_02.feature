Feature: The program has a mvt command
  Description: The program has a mvt command which allows the user to move files from one tag to another. It will also
  serve to move files from one location to the other while simultaneously updating location of tagged files in database.
  The program accepts comma delimited input in it's first and second parameter.

  Background:
    Given there are files that are tagged in location x
    And the mvt command is input

  Scenario:
    When there are no flags
    Then the program returns the basic usage information

  Scenario:
    When there are unknown tags in the first argument or in the second argument
    Then an error is produced with information on which tags are unknown and on how to create a tag

  Scenario:
    When there are known tags in the first and second arguments
    Then the first tags are eliminated from the files
    And the files are tagged with the second tags

  Scenario:
    When there are flags like those found in the mv command
    Then the program behaves similarly