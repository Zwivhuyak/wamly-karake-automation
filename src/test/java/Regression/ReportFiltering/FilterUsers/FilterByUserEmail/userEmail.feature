Feature: Filter Users by User Email
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  @FilterUsers
  Scenario Outline: Filter Users by user email
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/users'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.userEmail = '<userEmail>'
    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].email contains '<userEmail>'
    And print response

    Examples:
      |datasheet|


