Feature: The user can organize decks
  Description: The user can organize decks and combine them to study larger subsets

    Background:
      Given there are files to test
      And some files are tagged

    Scenario:
      When the user makes more than one deck
      Then the user can sort the decks by date

    Scenario:
      When the user makes more than one deck
      Then the user can sort the decks by size

    Scenario:
      When the user makes more than one deck
      Then the user can sort the decks by average timestamp due date

    Scenario:
      When the user makes more than one deck
      Then the user can combine the decks

    Scenario:
      When the user combines more than one deck
      Then the user can save the combined deck into a deck
