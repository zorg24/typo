Feature: Article Merging
  As an admin
  In order to show two of the same blog articles
  I want to comment on both articles
  And I want to merge both articles

  Background:
    Given the blog is created for the following users:
    | login  | password | email           | profile_id | name    | state    |
    | admin  | password | a@example.com   | 1          | butt    | active   |
    | user   | password | u@example.com   | 2          | face    | active   |

    When I login as user
    Given I am on the new article page
    When I fill in "article_title" with "Robots"
    And I fill in "article__body_and_extended_editor" with "Robots rule"
    And I press "Publish"
    Then I should be on the admin content page
    And I follow "Log out"

  Scenario: Non-admin cannot see merge button
    Given I login as user
    When I follow "All Articles"
    Then I follow "Robots"
    And I should see "New article"
    And the "article_title" field should contain "Robots"
    And I should not see "Merge Articles"

  Scenario: Admin can see Merge button
    Given I login as admin
    When I follow "All Articles"
    And I follow "Robots"
    Then I should see "New article"
    Then I should see "Merge Articles"