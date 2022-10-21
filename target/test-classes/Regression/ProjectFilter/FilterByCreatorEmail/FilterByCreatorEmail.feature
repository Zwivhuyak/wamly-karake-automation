Feature: Filter By Creator's Email
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  @Sprint
  Scenario Outline: Filter Projects By Creator's Email
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then bodys.creatorEmail = '<creatorEmail>'
    Then bodys.organizationId = '<organizationId>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response[*].creatorEmail contains '<creatorEmail>'
    Then print response
    And call read('classpath:../Regression/RememberFilterBy/RememberFilterByCreatorEmail/getFilterByCreatorEmail.feature')
    Examples:
      |datasheet|