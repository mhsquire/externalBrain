Feature: The program zips files into archives
  Description: The program

    Background:
      Given there are files to test
      And some files are tagged

    Scenario:
      When the user clicks on the archive window
      Then the user can select any number of tags

    Scenario:
      When the user selects any number of tags
      Then they can choose to sort the results

    Scenario:
      When the user has selected the files
      Then they can choose to archive the files

    Scenario:
      When the user chooses the archive the files
      Then an archive is made
