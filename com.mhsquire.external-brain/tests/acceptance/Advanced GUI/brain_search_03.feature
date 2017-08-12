Feature: The user can choose to delete the file
Description: When the program flashes a file at the user, or the user right clicking on files, they can
  delete a file

  Scenario:
    When the program flashes a file at the user
    Then they can choose to delete it

  Scenario:
    When the user chooses to delete a file
    Then they are asked if they really want to delete the file
    Given the user chooses yes
    Then the file is deleted

  Scenario:
    When the user chooses to delete a file
    Then they are asked if they really want to delete the file
    Given the user chooses no
    Then the file is not deleted

  Scenario:
    When the program flashes a file at the user
    And the file is already in the index
    Then the user can choose to remove it from the index

  Scenario:
    When the user right clicks a file
    Then the context menu gives the option to delete the file

  Scenario:
    When the user deletes a file that is in the index
    Then the file reference is deleted