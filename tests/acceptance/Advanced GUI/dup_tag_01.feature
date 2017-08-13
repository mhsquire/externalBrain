Feature: The program has an interface for processing dups
    Description: The interface consists of the ability to find Dups by tag, date, type, hash, etc

    Background:
      Given there are files to test with duplicates

    Scenario:
      Given the user clicks on the process duplicates option
      When the user chooses the criteria by which dups are found and clicks enter
      Then the program then finds dups based on the criteria forming a collection

    Scenario:
      When the user has created a collection of dups
      Then The user can enter a tag name for these dups

    Scenario:
      When the user has created a collection of dups
      Then the user can delete the collection of dups

    Scenario:
      When the user has created a collection of dups
      Then the user can delete the duplicate files

