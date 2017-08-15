Feature: The associate program allows the user to enter a dup tag mode when going through files
  Description: The special dup tag is added when the user wishes to mark a file as a duplicate. It can either
  be a symlink dup tag in which all but one file is deleted and symlinks are put in their place. or a regular dup
  in which one file is chosen as the master and the others are deleted. To make the users life easier the files are
  grouped together by Name, Date, File Type, Hash, Location, Tags, Size depending on commands the user enters.

  Background:
    Given there are a list of files with duplicates
    And the associate program with the dupe tag flag is running

  Scenario:
    When the user is presented a file list
    Then the user can select to group the files by Name, Date, File Type, Hash, Location, Tags, Size

  Scenario:
    When the user enters nothing in the first argument
    Then the file list is from the inbox tag

  Scenario:
    When the user enters a tag collection x in the 1st argument
    Then the file list is from the tag collection x list

  Scenario Outline: selection
    Given the user is presented a file list
    When the user enters a <criteria> command
    Then only files with <criteria> are returned

    Examples:
      | criteria
      | tag
      | type
      | hash
      | date
      | name
      | location
      | size

  Scenario:
    When the user enters a collection of files from the list in comma delimited format
    Then the program links those files together and marks them as duplicated

  Scenario:
    Given the user prints the dup list
    When the user enters a duplicated file from the list
    Then the program displays those linked files
    And the user can select a regular deletion dup op marking one file as master with --master
    And the non master files are deleted

  Scenario:
    Given the user prints the dup list
    When the user enters a duplicated file from the list
    Then the program displays those linked files
    And the user can select a regular deletion dup op marking one file as master with --symmaster
    And the non master files are symlinked to the master

  Scenario:
    Given there are duplicate file ops that are listed
    When the user enters the apply command
    Then the filesystem is updated with the changes
    And the database is updated with the canges
    And the results are printed to the console out