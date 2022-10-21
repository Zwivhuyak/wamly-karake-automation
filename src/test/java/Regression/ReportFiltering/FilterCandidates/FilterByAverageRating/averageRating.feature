Feature: Filter Candidates by Average Rating
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def manipulate = Java.type('common.manipulateCountry')
  @FilterCandidates
  Scenario Outline: Filter Candidates using Average Rating
    Given url 'https://api.uatwamly.co.za/wamly/v1/report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.aveRating = '<aveRating>'

    Then request bodys
    Then method post
    Then status 200
    * def average = manipulate.averageRating(response.response.data)
    And print average

#    Then match response.response.data[*].averageRating contains '<aveRating>'
    And print response

    Examples:
      |datasheet|


