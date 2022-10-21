Feature: Organization
  Background:
    * def datasheet = read('data.csv')
  @Regression
  Scenario Outline: Get Org Details

    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/f4312418-e16b-4b94-8e6a-e4b11156c56d'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then print response.response.postalAddress
    Then print response.response.address

    Examples:
    |datasheet|
