Feature: program flashes the top file from the queue
  Description: The program enters the brain tagging scene and flashes the top file from the queue

  Background:
    Given there are files to test
    And there are files in the queue
    And there is a file being shown


  Scenario:
      Then the program fills the GUI with the proposed tags

