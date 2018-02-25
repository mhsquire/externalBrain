Feature: a directory that exists in the view can be dragged
  and dropped onto another directory.

  Background:
    Given there are files to test

  Scenario:
    Given the target directory does exist
    When the view requests that a directory be added
    Then the directory is added to the list

  Scenario:
    Given the target directory does not exist
    When the view requests that a directory be added
    Then a toast message is passed to the user
    And the target directory is created
    And the directory is added to the target directory