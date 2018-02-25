Feature: When the user saves a list of files they can memorize it
  Description: When the user saves a list of files they can use that as a deck

    Background:
      Given there are files to test
      And some files are tagged

    Scenario:
      When the user saves a list of files
      Then the user can use that as a deck

    Scenario:
      When the user clicks on a deck to use
      Then the deck options menu opens

    Scenario:
      When the deck options menu opens
      Then the file organized by timestamp is presented to the user.

    Scenario:
      When the file is presented to the user
      Then the show again option is presented
      And the hard interval option is shown
      And the medium interval option is shown
      And the Easy interval option is shown

    Scenario:
      When the user chooses the show again option
      Then the file's timestamp is increased by one minute in the future

    Scenario:
      When the user chooses the hard interval option
      Then the file's timestamp is increased by the ease multiple for hard

    Scenario:
      When the user chooses the medium interval option
      Then the file's timestamp is increased by the ease multiple for medium

    Scenario:
      When the user chooses the easy interval option
      Then the file's timestamp is increased by the ease multiple for easy