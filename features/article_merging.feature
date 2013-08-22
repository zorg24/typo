Feature: Article Merging
  As an admin
  In order to show two of the same blog articles
  I want to comment on both articles
  And I want to merge both articles

  Background:
    Given the login is created for a user
    And I am logged into the Dashboard
    Given I am on the new article page
    When I fill in "article_title" with "Robots"
    And I fill in "article__body_and_extended_editor" with "Robots rule"
    And I press "Publish"
    Then I should be on the admin content page

  Scenario: Non-admin writes an article
    When I go to the home page
    Then I should see "Robots"
    When I follow "Robots"
    Then I should see "Robots rule"

  Scenario: Non-admin cannot see merge button
    When I follow "Edit"
    Then I should see "New article"
    And I should see "Publish"
    And the "article_title" field should contain "Robots"
    And I should not see "Merge with this Article"

  Scenario: Admin user can see Merge button
    When I follow "Log out"
    Then I should see "Login"
    Given the blog is set up
    When I am logged into the admin panel
    Then I should see "Dashboard"
    When I follow "All Articles"
    And I follow "Robots"
    Then I should see "Merge"