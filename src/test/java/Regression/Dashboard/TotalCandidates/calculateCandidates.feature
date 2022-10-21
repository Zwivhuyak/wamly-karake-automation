Feature:  Calculate the size of all candidates in all projects
  Background:
    * def datasheet = read('data.csv')
    * def projectSize = Java.type('common.CalculateProjects')

  @Dashboard
  Scenario Outline: Calculate the total number of candidates in all projects
    Given url 'https://api.uatwamly.co.za/wamly/v1//projects/<organizationId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    When method get
    * def result = response.response
    * def candidates = projectSize.getSizeOfCandidates(result)
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/project/stats'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And match response.response.totalCandidates == candidates
    And print response

    Examples:
      |datasheet|