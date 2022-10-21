# new feature
# Tags: optional

Feature: A description
  Background:
    * url BaseUrl
  Scenario: A scenario to change the form status
    Given path '/form/'+orgID+'/'+formID+'/default'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And print response