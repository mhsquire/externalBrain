Feature: The program has a tags command
  Description: The ls command lists files by location with options to show criteria by Name, Date, File Type, Hash,
  Location, Tags, Size. The Tags part is especially important and is the primary purpose of the lst command.

  Background:
    Given there is a list of files that have tags
    And the tags command is input

  Scenario:
    When the --tags flag is present
    Then the list of tags is returned

  Scenario:
    When no flag is present
    Then the files at the current location with a list of their tags is returned

  Scenario:
    When a tag name is present
    Then the list of files is returned with that tag

  Scenario:
    When several and delimited tag names are present
    Then all files with all of those tags is returned

  Scenario Outline:
    When the <flag> is present in the command
    Then the proper <results> format is returned for all files with those tags

    Examples:
      | flag | results  |
      | -all | all info |