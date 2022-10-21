Feature: Displaying particular projects according to page
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')

    Scenario Outline: Project pagination
      Given url 'https://api.uatwamly.co.za/wamly/v1/page/projects'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken
      Then request bodys
      Then method put
      Then status 200
      * def pageSize = bodys.pageSize
      * def totalProject = call read('classpath:../Regression/Dashboard/ProjectAnalytics/ProjectAnalytics.feature')
      * def total = totalProject.totalProjects
      * def result = Math.ceil(total / pageSize)
      Then status 200
      Then match response.totalPages == result
      And print response

      Examples:
      |datasheet|