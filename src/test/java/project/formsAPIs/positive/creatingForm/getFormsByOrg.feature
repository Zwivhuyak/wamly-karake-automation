# new feature
# Tags: optional

Feature: A description
  Background:
    * url BaseUrl

  Scenario: A scenario to get a forms in a organization
    Given path '/form/'+orgID
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    Then print response
