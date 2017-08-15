Feature: The associate program allows the user to manage the tags via the --manage flag
  Description: The program allows the user to manage the tags, CRUD operations

  Background:
    Given there is a list of tags in the database
    And associate --manage has been used to launch the program

  Scenario:
    When a tag is being entered into the database
    Then the database is checked to see if it exists already

  Scenario:
    When a new tag x is being entered into associate
    Then the new tag x is created in the database

  Scenario:
    When a tag collection is being used to list files in management display
    Then the appropriately tagged files are displayed

  Scenario:
    When a tag is being updated with additional files
    Then the list of files is added to

  Scenario:
    When a tag is being updated by subtracting files
    Then the list of files is diminished

  Scenario:
    When a tag is deleted
    Then that tag is eliminated from the database
    And the program asks the user if they want to remember the files

  Scenario:
    When a tag is deleted
    And the user does not want to remember
    Then the files without tags are dropped from the database

  Scenario:
    When a tag is deleted
    And the user wants to rememebr the files
    Then the files without tags have the inbox tag applied
