Feature: The program refers to the index and flashes a file
  Description: Flashes a file and awaits user input

  Background:
    Given there are files to test

  Scenario:
      When the program grabs a file from the index
      Then it can find the file on the hard drive

