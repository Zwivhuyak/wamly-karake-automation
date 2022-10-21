Feature: Displaying list of candidates completed the interview accordingly per page
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

    Scenario Outline: Candidates pagination
      Given url 'https://api.uatwamly.co.za/wamly/v1/page/project/interviews'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then request bodys
      Then method put
      Then status 200
      And print response

      Examples:
      |datasheet|