Feature: The associate program allows the user to apply tags when going through files
  Description: The associate program makes going through a list of files in a manual entry mode
  and the user can tag each file. This mode takes place in the shell.

  Background:
    Given that there are tagged and untagged files available
    And the associate program has been called

  Scenario:
    When the user adds a list of files to the database via inbox
    And they put nothing else into the arguments
    Then they can enter the manual entry mode of associate with inbox tag list specified

  Scenario:
    When the user puts collection of tags x into the first argument
    Then they can enter the manual entry mode of associate with x's tag list specified

  Scenario:
    When the user activates associate with a list of files
    Then they can enter the manual entry mode of associate with no tag list specified

  Scenario:
    Given there is a list of files in the list for associate
    When the user creates a new tag in the tag entry command box
    Then a new tag x is created
    And the user can choose to apply a new tag x to the file in the list that is currently on the stack

  Scenario:
    Given there is a list of files in the list for associate
    And the user chooses to tag all of the tags
    When the user creates a new tag in the tag entry box
    Then a new tag x is created
    And the user can choose to apply a new tag x to all files in the stack
