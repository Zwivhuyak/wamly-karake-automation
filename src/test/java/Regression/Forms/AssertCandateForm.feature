
Feature: Assert Forms
  Background:
    * def datasheet = read('data.csv')
    * def RequestBody = read('body.json')
  @Regression
  Scenario Outline: Creating form
    Given url 'https://api.uatwamly.co.za/wamly/v1//candidate/form/813237cb-83e3-4ca9-8f81-4298fc3029ac/andani1@mailsac.com'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    And print response





    Examples:
      |datasheet|