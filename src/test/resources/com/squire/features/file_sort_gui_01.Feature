Feature: The program can sort the files based on date
  Description: The program allows the user to sort files that it finds by date.

    Background:
      Given there are files to test
      And files that are indexed

    Scenario:
      When the user chooses the sort window
      Then the user can sort the files found by date


#    Scenario:
#      When the user sorts the files found by date
#      Then the user can tag the files
#
