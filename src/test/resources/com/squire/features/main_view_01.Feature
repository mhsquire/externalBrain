Feature: The program has a main GUI page for access to the other scenes
  Description: The main GUI page that opens the other features

  Background:
    Given that the program is running

  Scenario:
    Then they are presented with the main menu

#  Scenario:
#    When the user clicks on the process duplicates section of the main menu
#    Then the duplicates processing screen opens with several options

#  Scenario:
#    When the user clicks on the tags section of the main menu
#    Then the tags section window opens

#  Scenario:
#    When the user clicks on the janki search section of the main menu
#    Then the janki search section menu opens with menu options

  Scenario:
    When the user clicks on the file sort section of the main menu
    Then the file sort section opens with menu options

  Scenario:
    Given the program is in inbox mode
    When the user enters a new location to move a file to
    Then the folder is represented as an icon

  Scenario:
    Given the program is in inbox mode
    And there is a folder location represented on the screen from a previous move op
    When the user right clicks on the folder
    Then they can apply additional tags which apply to all files in the folder

  Scenario:
    Given the program is in inbox mode
    And there is a folder location represented on the screen from a previous move op
    When the user selects a file from the inbox
    And the user clicks once on the folder
    Then the file is transferred to that location


