Feature: Filter By all fields
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  @Regression
  Scenario Outline: Filter Projects By all fields
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then bodys.organizationId = '<organizationId>'
    Then bodys.creatorEmail = '<creatorEmail>'
    Then bodys.department = '<department>'
    Then bodys.endDate = '<endDate>'
    Then bodys.status = '<status>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response[*].creatorEmail contains '<creatorEmail>'
    Then match response.response[*].department contains '<department>'
    Then match response.response[*].end contains '<endDate>'
    Then match response.response[*].status contains '<status>'
    Then print bodys
    Examples:
      |datasheet|