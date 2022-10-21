Feature: Filter Candidates by Interview Status
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
  @FilterCandidates
  Scenario Outline: Filter Candidates using Interview Status
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.interviewStatus = '<interviewStatus>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].interviewStatus contains '<interviewStatus>'
    And print response

    Examples:
      |datasheet|


