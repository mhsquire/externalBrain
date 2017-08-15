Feature: the program has a command inbox
  Description: The inbox command takes in file locations and tags all the files found there with the inbox tag ignoring
  ones that are tagged. Unless the --inclusive flag is raised then all tagged and untagged files are tagged inbox. If
  the --recursive flag is raised then all of the files in the subdirectories will be included.

  Background:
    Given there are files that are not tagged in various directories and subdirectories
    And the inbox command has been input

  Scenario:
    Given none of the files in the immediate directory are tagged
    When there is nothing in the 1st parameter
    Then only the files in the immediate directory get tagged with inbox tag

  Scenario:
    Given some of the files in the immediate directory are tagged
    When there is nothing in the 1st parameter
    Then only the untagged files in the immediate directory get tagged with inbox tag

  Scenario:
    Given some of the file in the immediate directory are tagged
    When the --inclusive flag is raised
    Then all the files in the immediate directory get tagged with inbox tag

  Scenario:
    Given none of the files in the immediate directory and subdirectories are tagged
    When the --recursive flag is raised
    Then all the files in the immediate directory and subdirectories are tagged with inbox tag

  Scenario:
    Given some of the files in the immediate directory and subdirectories are tagged
    When the --inclusive and --recursive flags are raised
    Then all the files in the immediate directory and subdirectories are tagged with inbox tag
