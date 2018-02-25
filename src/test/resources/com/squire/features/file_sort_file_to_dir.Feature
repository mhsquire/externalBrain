Feature: the program has a class that is used to create a list of files to be moved or copied into a target directory.
  It is also used to remove files from the list should the user pass that command via the GUI.

  Background:
    Given there are files to test


  Scenario:
    Given the target directory does exist
    When the view requests a file be added to the list
    Then the file is added to the list under the directory

  Scenario:
    Given the target directory does not exist
    And the target directory does not exist in the list
    When the view requests a file be added to the list
    Then the target directory is created
    And the file is added to the list under the directory

  #Handle the case where a file is removed

  Scenario:
    Given the target directory does exist
    When the view requests a file be removed to the list
    Then the file is removed from the list under the directory

  #handle the case where a file is removed and the directory does not exist
  Scenario:
    Given the target directory does not exist
    And the target directory does not exist in the list
    When the view requests a file be removed from the list
    Then an error is produced because something is wrong with the program