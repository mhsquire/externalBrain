Feature: The program has a mktag command
  Description: The user can enter the mktag command and make a new tag. The tag can be instantly applied to the current
  location's files. The tag can be instantly applied to a collection of files that have a group of tags. The tag can
  be instantly applied to a list of files supplied via it's input.


  Background:
    Given there are files to test
    And tag y exists in the database already
    And the mktag command has been input

  Scenario:
    Given tag x is new
    When tag x is entered in argument 1
    Then tag x is compared to the database of tags
    And placed in the database

  Scenario:
    Given tag y is a duplicate of another tag
    When tag y is entered in argument 1
    Then tag y is compared to the database of tags
    And an error message is output explaining that the tag already exists

  Scenario:
    Given tag x is new
    When the -l flag is raised
    And tag x is entered in argument 1
    Then tag x is compared to the database of tags
    And all the files in the current directory are tagged


  Scenario:
    Given tag x is new
    And a collection of tags z is unique
    When tag x is entered in argument 2
    And a collection of tags z are entered in argument 1
    Then tag x is compared to the database of tags
    And all the files that match the collection of tags z are tagged with the new tag

