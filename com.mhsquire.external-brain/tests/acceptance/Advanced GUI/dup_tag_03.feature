Feature: The program finds duplicate tag combinations and asks for additional clarifying tag
  Description: The program finds duplicate tag combinations and asks for additional clarifying tag. The clarifying tag
  is accepted and the dup goes to a done list. The changes are then accepted.

  Background:
    Given there are files that are tagged

  Scenario:
    Given there is at least one tag combination
    When the user changes the number combination slider
    Then the list of tag combinations shrinks and grows

  Scenario:
    When the slider first appears
    Then the list is populated with the top ten tag combinations

  Scenario:
    When the user selects a tag combination out of the list
    Then the program displays the files associated with that query

  Scenario:
    When the user enters the brain search mode using that query
    Then the user can use brain search mode to modify the files
