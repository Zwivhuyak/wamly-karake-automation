Feature: Status
  Background:
    * def datasheet = read('data.csv')

  @Regression
  Scenario Outline: Get All status
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<orgId>'
    * def username = '<username>'
    * def password = '<password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    Then match response.message == 'Organization'
    * def statusResponse = response.response.customCandidateStatus
    Then print statusResponse


    Examples:
    |datasheet|