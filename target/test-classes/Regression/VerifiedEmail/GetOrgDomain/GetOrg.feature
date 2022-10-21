Feature: Get Domain
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  Scenario Outline: Candidates pagination
    Given url 'https://api.uatwamly.co.za/wamly/v1/custom/domain/<organizationId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then print response

    Examples:
      |datasheet|