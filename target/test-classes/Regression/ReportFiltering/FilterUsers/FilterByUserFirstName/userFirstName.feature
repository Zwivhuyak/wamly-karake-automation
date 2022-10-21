Feature: Filter Users by User First Name
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  @FilterUsers
  Scenario Outline: Filter Users by user first name
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/users'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.firstName = '<firstName>'
    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].name contains '<firstName>'
    And print response

    Examples:
      |datasheet|


