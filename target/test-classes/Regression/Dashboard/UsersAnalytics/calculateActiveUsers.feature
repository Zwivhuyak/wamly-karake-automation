Feature:  Calculate the total number of active users
  Background:
    * def datasheet = read('data.csv')
    * def totalUsers = Java.type('common.CalculateUsers')

  @Dashboard
  Scenario Outline: Calculate the total number of active users
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/users/<organizationId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    When method get
    * def result = response.response
    * def totalUsers2 = totalUsers.calculateActiveUsers(result)

    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/project/stats'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And match response.response.totalUsers == totalUsers2
    And print response

    Examples:
      |datasheet|