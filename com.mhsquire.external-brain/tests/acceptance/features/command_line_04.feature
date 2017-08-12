Feature: The program has a st command
  Description: The spt command splits a group of files defined by the first parameter of tags into two lists based on a
  those that contain the second parameter of tags and those that don't. An optional third parameter can be placed on the
  first or second group.

  Background:
    Given there are files with a number of tags
    And the spt command has been inputted

  Scenario:
    When there are no flags
    Then the usage information is displayed

  Scenario:
    When there are unknown tags in the first argument or in the second argument
    Then an error is produced with information on which tags are unknown and on how to create a tag

  Scenario:
    When there are known tags in the first and second arguments
    Then the tags from the first argument are used to create a collection
    And those that have tags of the second argument are output as group A
    And those that do not have tags of the second argument are output as group B

  Scenario:
    When there are known tags in the first and second arguments
    And there is a flag -1 indicating the third set of tags should be placed on 1st collection
    Then the tags from the first argument are used to create a collection
    And those that have tags of the second argument will have the third argument tags applied
    And those that do not have tags of the second argument are left alone

  Scenario:
    When there are known tags in the first and second arguments
    And there is a flag -2 indicating the third set of tags should be placed on 2nd collection
    Then the tags from the first argument are used to create a collection
    And those that have tags of the second argument are left alone
    And those that do not have tags of the second argument will have the third argument tags applied