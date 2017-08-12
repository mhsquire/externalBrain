Feature: The user can choose to make the file memorable
  Description: The program automatically puts a future timestamp on a memoed file. This timestamp determines
  when the program will bring the file to the attention of the user again.

  Background:
    Given there are files to test
    And there is a file in the index

    Scenario:
      When the user changes the settings of a file
      Then the program updates the timestamp back to show the file sooner

    Scenario:
      When the user does not change the file
      Then the program updates the timestamp forward to show the file later

    Scenario:
      When the user accesses the program
      Then the next file is shown

    Scenario:
