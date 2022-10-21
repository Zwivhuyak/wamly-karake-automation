Feature: Project Filtering
  Background:
    * def data = read('data.csv')
  @Regression
  Scenario Outline: View Rating as : <Permission>

    Given url 'https://api.uatwamly.co.za/wamly/v1/f008d630-615e-4c43-b280-7f2c76bd0811/project/60f7f880-7483-4444-9387-d6cc9c3388bf/interviews'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then status 200
    Then print response

    Examples:
    |data|