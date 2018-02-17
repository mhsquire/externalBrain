Feature: The program makes a queue of the files on the system by location or by query
  Description: A queue of files is created from the database if the file is tagged with a time code then it is inserted
  in order of that time code with the newest virgin cards mixed in.

  Background:
    Given there are files to test

  Scenario:
    When the user tags a file
    And hits the apply button
    Then the file is tagged in TMSU with the timecode of when it was last seen

#  Scenario:
#    Given that a file is not in the TMSU database
#    When the file is placed in the queue
#    Then the files metadata is saved in the database as a set of tags
#
#  Scenario:
#    Given that a file is in the TMSU database
#    When the queue is created each file is checked for membership in the database
#    Then the file data is restored by the program
#
#  Scenario:
#    Given there is a queue of files
#    When a file is flashed to the user
#    Then the user can select any combination of files from the queue
#
#  Scenario:
#    When the user selects a collection of files
#    Then the user can add a tag to the files
#
#  Scenario:
#    When the user selects a collection of files
#    Then the user can remove a tag from the files
#
#  Scenario:
#    Given there are files that are tagged
#    Then those tagged files can be moved to a location together