Feature: Delete Answer
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

  Scenario Outline: Candidates pagination
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/candidate/interview/7e4ed0f2-2ba2-4078-ab30-5e8382cd81ce'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method delete
    Then print response

    Examples:
    |datasheet|