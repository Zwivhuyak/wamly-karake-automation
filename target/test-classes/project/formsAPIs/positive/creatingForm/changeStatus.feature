# new feature
# Tags: optional

Feature: A description
  Background:
    * url BaseUrl
  Scenario: A scenario to change the form status from active to inactive
    Given path '/form/'+orgID+'/'+formID+'/status'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And print response