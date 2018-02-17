Feature: The program has an interface for finding dups
    Description: The interface consists of the ability to create a collection by tag, date, type, hash, size, location, etc

    Background:
      Given there are files to test with duplicates
      And the user clicks on the process duplicates option

    Scenario:
      Then the program displays an advanced query button

    Scenario:
      When the user clicks the query button
      Then the program replaces basic search with the query field

    Scenario:
      Given the advanced query box is open
      When the user enters an advanced query
      Then the program creates a collection that matches that query

    Scenario:
      Then the program displays a date picker for file creation date
      And the program displays a earlier / later than radio button

    Scenario Outline:
      When the user selects a date in the date picker
      And selects <time> than radio button
      And selects apply
      Then files are retrieved into a collection with creation dates <when> the date

    Examples:
      | time    | when   |
      | earlier | before |
      | later   | after  |

    Scenario:
      Then the program displays a tag box

    Scenario:
      When the user puts tags into the tag box
      And selects apply
      Then files are retrieved only if they have those tags

    Scenario:
      Then the program displays a type type box

    Scenario:
      When the user inputs file extensions into the file type box
      Then files are retrieved into a collection that match those file types

    Scenario:
      Then the program displays a size slider
      And the program displays a size input box
      And the program displays a size less than / greater than radio button

    Scenario:
      When the user selects a size on the slider
      Then the size in the box changes

    Scenario Outline:
      When the user inputs a size in the box
      And selects the <relationship> button
      And selects apply
      Then files are retrieved into a collection whose size is <relationship> to the file size

      Examples:
      | relationship |
      | greater than |
      | less than    |

    Scenario:
      Then the program displays a recursive location box
      And a plus button

    Scenario:
      When the user clicks the plus button
      Then the program adds another recursive location box to the file search

    Scenario:
      When the user enters a file path into the recursive location box
      Then the program displays all the files recursively on that path are

    Scenario:
      When the user chooses the criteria by which dups are found and clicks apply
      Then the program then finds dups based on the criteria forming a collection

    Scenario:
      When the user has created a collection of dups
      Then The user can enter a tag name for these dups

    Scenario:
      Given the user has created a collection of dups
      When the user clicks on the delete button specifying a master file
      Then the program deletes the duplicate files except for the master file

    Scenario:
      Given the user has created a collection of dups
      When the user clicks on the delete button without specifying a master file
      Then the program asks the user if they want to delete all the files

    Scenario:
      Given the user has created a collection of dups
      And the user clicks on the delete button without specifying a master file
      And the program asks the user if they want to delete all the files
      When the user clicks the no button
      Then the program does not delete all the files in the collection

    Scenario:
      Given the user has created a collection of dups
      And the user clicks on the delete button without specifying a master file
      And the program asks the user if they want to delete all the files
      When the user clicks the yes button
      Then the program deletes all the files in the collection

    Scenario:
      Given the user has created a collection of dups
      When the user clicks on the symlink button specifying a master file
      Then the program deletes the duplicate files except for the master file
      And replaces the deleted files with symlinks

