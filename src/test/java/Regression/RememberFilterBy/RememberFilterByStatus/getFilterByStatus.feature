Feature: Get Filter By Status
  Background:
    * def datasheet = read('data.csv')
  @FilterBy
  Scenario Outline: Remember Filter Of Status
    Given url 'https://api.uatwamly.co.za/wamly/v1/user/filters'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then method get
    Then status 200
    Then match response.response.status contains '<status>'
    Then print response
    Examples:
      |datasheet|