Feature: The user can create directories in a free form space
  and drag and drop files from the GUI file list into directories.


  Background:
    Given there are files to test

  #handle the case where a directory is not present
  # (should highlight with new directory sub-icon)
  Scenario:
    When the user clicks an empty space on the space
    And the user names the directory
    And the directory is not a directory in the filesystem
    Then the directory is created
    And the directory is marked with the new sub-icon

  #handle the case where a directory is already present
  # (should highlight)

  Scenario:
    When the user clicks an empty space on the space
    And the user names the directory
    And the directory is a directory in the filesystem
    Then the directory is created

  Scenario:
    When a user clicks on a directory in the free form space
    Then the list of files is shown in the sub-list
    And the list of directories is shown in the sub-list

  Scenario:
    When a user clicks on a directory in the free form space
    Then the user can drag the folder to a new position

  Scenario:
    When a user clicks on a directory in the free form space
    Then the user can drop the folder into a new folder.