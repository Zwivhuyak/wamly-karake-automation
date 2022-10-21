Feature: Filter By Status
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')


  @Sprint
  Scenario Outline: Filter Projects By Status
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then bodys.organizationId = '<organizationId>'
    Then bodys.status = '<status>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response[*].status contains '<status>'
    Then print response
    And call read('classpath:../Regression/RememberFilterBy/RememberFilterByStatus/getFilterByStatus.feature')
    Examples:
      |datasheet|