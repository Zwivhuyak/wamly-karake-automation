Feature: Filter Candidates by departments
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
  Scenario Outline: Filter Candidates using departments
    Given url 'https://api.uatwamly.co.za/wamly/v1/report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.department = '<departmentId>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].projectDepartment contains '<departmentName>'
    And print response

    Examples:
      |datasheet|


