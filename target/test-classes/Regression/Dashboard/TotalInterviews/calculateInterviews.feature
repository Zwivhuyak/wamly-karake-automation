Feature:  Calculate the total number of interviews completed
  Background:
    * def datasheet = read('data.csv')
    * def projectSize = Java.type('common.CalculateProjects')

  @Dashboard
  Scenario Outline: Calculate the total number of interviews completed
    Given url 'https://api.uatwamly.co.za/wamly/v1//projects/<organizationId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    When method get
    * def result = response.response
    * def totalInterviews = projectSize.getTotalInterviews(result)

    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/project/stats'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And match response.response.totalInterviews == totalInterviews
    And print response

    Examples:
      |datasheet|