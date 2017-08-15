Feature: The user can choose to delete the file displayed
Description: When the program flashes a file at the user in the brain tag scene they can choose to delete the file 
  completely from the database or from the filesystem and the database

  Background: 
    Given there are files to test
    And there are files in the queue
    And there is a file being shown


  Scenario:
    Then they can choose to delete it from the database

  Scenario: 
    Then they can choose to delete it from the filesystem
    
  Scenario:
    Given the user chooses to delete a file from the database
    And they are asked if they really want to delete the file
    When the user chooses yes
    Then the file is deleted from the database

  Scenario:
    Given the user chooses to delete a file from the filesystem
    And they are asked if they really want to delete the file
    When the user chooses yes
    Then the file is deleted from the database 
    And the file is deleted from the filesystem
    
  Scenario:
    Given the user chooses to delete a file from the database
    And they are asked if they really want to delete the file
    When the user chooses no
    Then the file is not deleted from the database

  Scenario:
    Given the user chooses to delete a file from the filesystem
    And they are asked if they really want to delete the file
    When the user chooses no
    Then the file is not deleted from the filesystem  
    
  Scenario:
    When the program flashes a file at the user
    Then the user can choose to ignore and remove it from the queue

  Scenario:
    When the user right clicks a file
    Then the context menu gives the option to delete the file

  Scenario:
    When the user deletes a file that is in the queue
    Then the file reference is deleted