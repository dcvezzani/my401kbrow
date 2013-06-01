Feature: Plan Sponsor Manage Profile
	In order to make adjustments to my profile
	As a my401k plan sponsor
	I want to be able to access 'Basic Information', 'Admin Delegates', 'Portal Branding'
															'Participant Access Control', 'Subscription Status',
															'Sponsor Contacts', and 'Alert Preferences'
															and make necessary changes.
															

Scenario: View plan information
	Given I am a plan sponsor
	And I navigate to '/plan_sponsor/manage_profile/basic_information'
	Then I should see Basic Information, Administrator Information, and Replacement Administrator Information populated with data.
	





Given 
And
When
Then