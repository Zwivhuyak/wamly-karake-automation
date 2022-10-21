Feature: Filter Candidates by Custom Status
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
  @FilterCandidates
  Scenario Outline: Filter Candidates using Custom Status
    Given url 'https://api.uatwamly.co.za/wamly/v1/report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.customStatus = '<customStatus>'


    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].customStatus contains '<customStatus>'
    And print response

    Examples:
      |datasheet|


