Feature: the program has a class that is used to create a directory for files to be moved or copied into.

  Background:
    Given there are files to test

  #handle the case where a folder is added
  Scenario:
    Given the target directory does not exist
    When the view requests that a directory be added
    Then the directory is added to the list
    And the directory is returned

  Scenario:
    Given the target directory does exist
    When the view requests that a directory be added
    Then the directory is returned

  #handle the case where a folder is removed
  Scenario:
    Given the target directory does exist
    When the view requests that a directory be removed
    Then the file list is saved
    And the directory is removed from the list
    And a success message is returned

  Scenario:
    Given the target directory does not exist
    When the view requests that a directory be removed
    Then the directory is removed from the list
    And a success message is returned

