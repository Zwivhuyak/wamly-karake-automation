Feature: Duplicate email template
  Background:
    * def datasheet = read('data.csv')
    * def body = read('body.json')
  @EmailTemplate
  Scenario Outline: Make a copy of email template
    Given url 'https://api.uatwamly.co.za/wamly/v1//templates/<organizationId>/createcopy/<guideId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then request body
    And method post
    And status 200
    And print response

    Examples:
      |datasheet|