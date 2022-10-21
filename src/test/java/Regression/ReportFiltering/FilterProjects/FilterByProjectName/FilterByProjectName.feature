Feature: Filter Projects by project name
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    Scenario Outline: Filter Projects using project name
      Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/projects'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then set bodys.organizationId = '<organizationId>'
      Then set bodys.projectName = '<projectName>'

      Then request bodys
      Then method post
      Then print response
      Then status 200
      Then match response.response.data[*].projectName contains '<projectName>'
      And print response

      Examples:
      |datasheet|


