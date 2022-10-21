# new feature
# Tags: optional

Feature: A description
  Background:
    * def body = read('classpath:baserequest/generateToken.json')
    * def datasheet = read('data.csv')

  Scenario Outline: A scenario
    Given url 'https://ob4tlf46j7.execute-api.eu-west-1.amazonaws.com/default/GetToken'
    When request body
    * def username = karate.get('username', '<Email>')
    * def password = karate.get('password', '<Password>')
    And body.USERNAME = username
    And body.PASSWORD = password
    When method post
    Then status 200
    * def AccessToken = response.AuthenticationResult.IdToken

    Examples:
    |datasheet|



