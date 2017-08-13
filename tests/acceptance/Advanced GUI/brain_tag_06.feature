Feature: The user can choose to change the file memorablity
  Description: The program automatically puts a future timestamp on a memoed file. This timestamp determines
  when the program will bring the file to the attention of the user again.

  Background:
    Given there are files to test
    And there are files in the queue
    And there is a file being shown

    Scenario:
      Then the modification date is shown

    Scenario:
      Then the familiar option is shown

    Scenario Outline:
      When the user chooses the <option>
      Then the timestamp is adjusted backward by janki <amount> time

    Examples:
      | option         | amount  |
      | familiar       |  long   |
      | sorta familiar |  medium |
      | not familiar   |  short  |

    Scenario Outline:
      When the user changes the modification date of the file <direction>
      Then the program updates the timestamp <direction> to show the file <time>

    Examples:
      | direction | time     |
      | backward  | sooner   |
      | forward  | later    |
      | the same  | the same |

    Scenario:
      When the user does not change the file attributes
      And chooses apply
      Then the program changes the timestamp to show the file later

    Scenario:
      When the user accesses the program again
      Then the same queue with the same file is shown

