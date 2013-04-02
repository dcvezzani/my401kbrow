Feature: Content Pages
  Editors should be able to manage their own pages

  Background:
    #Given I am using the "ABC" site
    Given I am a guest
    #Given I am a xguest

  Scenario: A user who is not logged in tries to access a CMS page in production
    When a user who is not logged in visits "/my401k/plan_sponsor/create_new_content"
    Then they should be redirected to "http://www.example.com/cms/login"
    And the response should be 200

  Scenario: A user who is logged in starts out creating content by selecting the type of product
    When a registered user visits "/my401k/plan_sponsor/create_new_content"
    Then they should see "Select Section"
    And the response should be 200

