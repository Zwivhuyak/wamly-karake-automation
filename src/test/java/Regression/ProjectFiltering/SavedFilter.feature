Feature: Project Filter
  @Regression
  Scenario: Saved Filter

Given url 'https://api.uatwamly.co.za/wamly/v1/user/filters'
    And call read('classpath:../Authentication/getToken.feature')
And header Authorization = 'Bearer '+AccessToken
Then method get
    Then status 200
Then print response
