Feature:  Calculate the size of all projects
  Background:
    * def datasheet = read('data.csv')
    * def projectSize = Java.type('common.CalculateProjects')

  @Dashboard
  Scenario Outline: Calculate the size of all projects Active InActive and Draft
    Given url 'https://api.uatwamly.co.za/wamly/v1//projects/<organizationId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    When method get
    * def result = response.response
    * def totalProjects = karate.sizeOf(response.response);
    * def projectResults = projectSize.getSizeOfProjects(result)
    * def activeProjects = projectResults[0]
    * def inactiveProjects = projectResults[1]
    * def draftProjects = projectResults[2]


    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<organizationId>/project/stats'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And match response.response.totalProjects == totalProjects
    And match response.response.activeProjects == activeProjects
    And match response.response.inactiveProjects == inactiveProjects
    And match response.response.draft == draftProjects
    And print response

    Examples:
      |datasheet|