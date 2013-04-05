Feature: Content Pages
  Editors should be able to manage their own pages

  Background:
    #Given I am using the "ABC" site
    Given I am a guest
    When I visit "/my401k/plan_sponsor/create_new_content"
    And login as a plan sponsor
    #Given I am a xguest

  Scenario: A user who is not logged in tries to access a CMS page in production
    Given I am a guest
    When a user who is not logged in visits "/my401k/plan_sponsor/create_new_content"
    Then they should be redirected to "http://www.example.com/cms/login"
    And the response should be 200

  Scenario: An editor starts out creating content by selecting the type of product
    When I examine the page
    Then I should see "Select Section"
    And the response should be 200

  @javascript
  Scenario: An editor selects the product category; selection is persisted in the form
    When I click on "category-about-plan"
    Then the radio button associated with "#category-about-plan" should be checked
    And an article in progress should exist in the database

  @javascript
  Scenario: An editor selects the product category; a sketched circle indicates the active selection
    When I click on "category-plan-enrollment"
    Then the radio button associated with "#category-plan-enrollment" should be checked
    And "category-plan-enrollment" should have a circle drawn around it
    And there should only be one drawn circle at a time on the page
    And an article in progress should exist in the database

  @javascript
  Scenario: An editor saves the selected category and navigates next to select the desired layout
    When I click on "category-about-plan"
    And I click on "Next" on the active tab
    Then I should see "Select Layout"
    And an article in progress should exist in the database

  @javascript
  Scenario: At the most, there should only be one untouched draft Article at any given time
    When I click on "category-about-plan"
    And I click on "Next" on the active tab
    Then I should see "Select Layout"
    And I click on "Previous" on the active tab
    Then I should see "Select Section"
    And an article in progress should exist in the database

  @javascript
  Scenario: An editor saves the selected layout and navigates next to select the desired layout
    When I click on "category-about-plan"
    And I click on "Next" on the active tab
    Then I should see "Select Layout"
    And I click on "Select Layout"
    Then I should see "Layout 2"
    And I click on item "#layout-2"
    Then there should only be one drawn circle at a time on the active tab
    And I click on "Previous" on the active tab
    Then I should see "Main Section"
    And an article in progress should exist in the database
    
  @javascript
  Scenario: An editor can move between tabs (using 'Previous' and 'Next' buttons); the wizard remembers previous selections
    When I click on "category-special-offers"
    And I click on "Next" on the active tab
    And I click on item "#layout-2"
    And I click on "Previous" on the active tab
    And I wait for 1 seconds
    Then there should be a drawn circle around item "#category-special-offers"
    And the radio button associated with "#category-special-offers" should be checked
    And I click on "Next" on the active tab
    And I wait for 1 seconds
    Then there should be a drawn circle around item "#layout-2"

