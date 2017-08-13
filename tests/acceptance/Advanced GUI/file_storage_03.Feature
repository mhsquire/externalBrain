Feature: The program remembers the indexes of the backups so the user can memorize whats in each backup
  Description: The program remembers the indexes of the backups so the user can memorize whats in each backup

  Background:
    Given there are files to test
    And some files are tagged

  Scenario:
    When the user has backed up a group of files
    Then the program stores the list

  Scenario:
    When the program stores a list
    Then the list can be used as a deck
