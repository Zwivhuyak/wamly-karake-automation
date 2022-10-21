Feature: Filter Candidates by Nationality
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
  @FilterCandidates
  Scenario Outline: Filter Candidates using Nationality
    Given url 'https://api.uatwamly.co.za/wamly/v1/report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.fields.id = '<nationalityId>'
    Then set bodys.fields.responses[1].id = '<nationalityId>'
    Then set bodys.fields.responses[1].value = '<value>'
    Then set bodys.fields.responses[1].selected = <selected>

    Then request bodys
    Then method post
    Then status 200
    Then match response.response.data[*].candidateForm.infoDTOS[*].fieldName contains '<field>'
    Then match response.response.data[*].candidateForm.infoDTOS[*].value contains '<value>'
    And print response

    Examples:
      |datasheet|


