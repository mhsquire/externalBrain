Feature: The program has a cpt command
  Description: The cpt command copies tags from the second argument onto each file in a list defined by a collection
  of tags defined by the first argument effectively merging the tags for each file. The program accepts comma delimited
  input in it's first and second parameter.


  Background:
    Given there are files with a number of tags
    And the cpt command has been inputted

  Scenario:
    When there are no flags
    Then the usage information is displayed

  Scenario:
    When there are unknown tags in the first argument or in the second argument
    Then an error is produced with information on which tags are unknown and on how to create a tag

  Scenario:
    When there are known tags in the first and second arguments
    Then the tags from the first are compared to the second eliminating duplicate tags
    And the files are tagged with the list of unique tags

  Scenario:
    When there are flags like those found in the cp command
    Then the program behaves similarly

