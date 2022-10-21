Feature: Filter Projects by Send From Email
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
  Scenario Outline: Filter Projects using Send From Email
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/projects'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.sendFromEmail = '<sendFromEmail>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].sendFromEmail contains '<sendFromEmail>'
    Then match response.message == 'Projects searched successfully'
    And print response

    Examples:
      |datasheet|


