Feature: Manage Categories
  As a blog administrator
  In order to group blog entries by categories
  I want to be able to add and edit Categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "Categories"
    
  Scenario: Succesfully shows the new category page
    Then I am on the categories page
    
  Scenario: It should be able to add a category
        When I fill in the following:
			| category_name			| Test category	    |
		    | category_keywords		| Test key	     	|
		    | category_permalink	| Test link 	 	|
    		| category_description	| Test description	|
    And I press "Save"
    Then I should see "Test category"
    And I should see "Test key"
    And I should see "Test link"
    And I should see "Test description"

# To handle the case when there are no existing categories I'm creating a new category before editing it 
  Scenario: It should be able to edit a category
    When I fill in "category_name" with "created to edit"
    And I press "Save"
    Then I should see "created to edit"
    When I follow "created to edit"
    And I fill in "category_description" with "description edited successfully"
    And I press "Save"
    Then I should see "created to edit"
    And I should see "description edited successfully"