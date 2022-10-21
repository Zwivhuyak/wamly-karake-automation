Feature: Get Filter By End Date
  Background:
    * def datasheet = read('data.csv')
  @Regression
  Scenario Outline: Remember Filter Of End Date
    Given url 'https://api.uatwamly.co.za/wamly/v1/user/filters'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then method get
    Then status 200
    Then match response.response.endDate contains '<endDate>'
    Then print response
    Examples:
      |datasheet|