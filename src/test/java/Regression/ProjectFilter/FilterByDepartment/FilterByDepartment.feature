Feature: Filter By Department
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  @Sprint
  Scenario Outline: Filter Projects By Department
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.department = '<department>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response[*].department contains '<department>'
    Then print response
    And call read('classpath:../Regression/RememberFilterBy/RememberFilterByDepartment/getFilterByDepartment.feature')
    Examples:
      |datasheet|