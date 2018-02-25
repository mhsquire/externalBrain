Feature: The program can sort files based on size
  Description: The files found by the user can be sorted by size

    Background:
      Given there are files to test
      And some files are tagged

    Scenario:
      When the user clicks on the sort window
      Then the user can sort the files found by size

#    Scenario:
#      When the user clicks on the sort window
#      Then the user can choose any number of tags
#
#    Scenario:
#      When the user chooses any number of tags
#      Then the user can sort the results by size
