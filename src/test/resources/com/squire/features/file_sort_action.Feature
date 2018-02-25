Feature: The program executes the file sort after the user presses a button on the UI to make the sort official.

  Background:
    Given there are files to test

  #Handle when a file is added to a target directory
  #that does not exist

  Scenario:
    Given there are files marked for moving
    And the target directory does not exist
    When the action button is pressed
    Then the directory is created in the filesystem
    And the files are moved to the target directory

  #Handle directory created already
  Scenario:
    Given there are files marked for moving
    And the target directory does exist
    When the action button is pressed
    Then the files are moved to the target directory

  #Handle file system errors
  Scenario:
    Given there are files marked for moving but they are copy protected
    And the target directory does not exist
    When the action button is pressed
    Then the directory is created in the filesystem
    And the files are not moved to the target directory
    And access errors are detected
    And information about the errors is passed to the user via GUI toast message

  #Handle there are files that don't exist anymore
  Scenario:
    Given there are files marked for moving but they don't exist in the filesystem
    And the target directory does not exist
    When the action button is pressed
    Then the directory is created in the filesystem
    And the files are moved to the target directory
    And non-existent file errors are detected
    And information about the errors is passed to the user via GUI toast message

  #Handle when a directory is added to another directory
  Scenario:
    Given there are directories marked for moving
    And the target directory does not exist
    When the action button is pressed
    Then the directory is created in the filesystem
    And the directories are moved to the target directory
    And the files of the directories are moved to the target directory

  #Handle when a target directory has been created already
  Scenario:
    Given there are directories marked for moving
    And the target directory does exist
    When the action button is pressed
    Then the directories are moved to the target directory
    And the files of the directories are moved to the target directory
