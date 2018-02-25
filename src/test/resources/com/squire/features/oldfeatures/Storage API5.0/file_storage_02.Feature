Feature: The program makes an img file for burning
  Description: The user can choose a group of files to be saved to an img archive

    Background:
      Given there are files to test
      And some files are tagged

    Scenario:
      When the user enters the archive menu
      Then they can choose any number of tags

    Scenario:
      When the user chooses any number of tags
      Then they can sort the result

    Scenario:
      When the user has a set of files they want to burn an image of
      Then they can create a .img file
