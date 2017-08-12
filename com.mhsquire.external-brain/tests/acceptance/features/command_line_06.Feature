Feature: The program has a rmtag command
  Description: When the user executes rmtag with a collection of tags that is in the database then all the files
  with those tags are striped of the tags matching those in the collection. When a file has no tags it is placed back
  into the inbox unless the --remember flag is raised.

    Background:
      Given there are files to test with tags
      And the rmtag command has been entered

    Scenario:
      Given tag collection x is a collection of known tags
      When the user places tag collection x in the first argument
      Then a confirmation notice comes up

    Scenario:
      Given tag collection x is a collection of known tags
      When the user places collection x in the first argument
      And types yes on the command prompt after the confirmation notice
      Then the tags on each file that match tags in the collection are removed

    Scenario:
      Given tag collection x is a collection of known tags
      And there are files with only one tag y which is in x
      When the tags are removed
      Then the files with no tags are removed from the database

    Scenario:
      Given tag collection x is a collection of known tags
      And there are files with only one tag y which is in x
      When the user raises the flag --remember
      And the user places collection x in the first argument
      And types yes on the command prompt after the confirmation notice
      Then the files with no tags are placed in the inbox