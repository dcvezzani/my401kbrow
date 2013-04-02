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

  Scenario: An editor starts out creating content by selecting the type of product
    When a registered user visits "/my401k/plan_sponsor/create_new_content"
    Then they should see "Select Section"
    And the response should be 200

  @javascript
  Scenario: An editor selects the product category; selection is persisted in the form
    When a registered user visits "/my401k/plan_sponsor/create_new_content"
    And clicks on "category-about-plan"
    Then the radio button associated with "category-about-plan" should be checked

  @javascript
  Scenario: An editor selects the product category; a sketched circle indicates the active selection
    When a registered user visits "/my401k/plan_sponsor/create_new_content"
    And clicks on "category-plan-enrollment"
    Then the radio button associated with "category-plan-enrollment" should be checked
    And "category-plan-enrollment" should have a circle drawn around it
    And there should only be one drawn circle at a time on the page

  @javascript
  Scenario: An editor saves the selected category and navigates next to select the desired layout
    When a registered user visits "/my401k/plan_sponsor/create_new_content"
    And clicks on "category-about-plan"
    And clicks on "Next"
    Then they should see "Select Layout"

