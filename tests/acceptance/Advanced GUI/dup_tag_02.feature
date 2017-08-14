Feature: The program allows the user to apply a dup tag when going through files
    Description: A duplicate marker system, instead of using a duplicate finder program the user Tags files as
    being duplicates and then decide what to do with them.

  Background:
    Given that the user has created a collection of files

  Scenario:
    When the user clicks on a file in the collection
    Then the file is marked with a tag tentatively and selected

  Scenario:
    When the user clicks on a file marked tentatively with a tag
    Then the file is unmarked and deselected for tagging

  Scenario:
    When the user clicks into the name tag box and types
    Then the box is filled with the users selected tag name

  Scenario:
    When the user clicks enter next to the tag box
    Then all selected files are tagged as duplicates of each other
