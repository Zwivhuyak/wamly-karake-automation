Feature: Create Forms
  Background:
    * def datasheet = read('data.csv')
    * def RequestBody = read('body.json')
  @Regression
 Scenario Outline: Creating form
   Given url 'https://api.uatwamly.co.za/wamly/v1/form'
   * def username = '<Email>'
   * def password = '<Password>'
   And call read('classpath:../Authentication/getToken.feature')
   And header Authorization = 'Bearer '+AccessToken
   When request RequestBody
   Then method post
   Then print RequestBody
   Then print "--------------------------------------------------------"

   Given url 'https://api.uatwamly.co.za/wamly/v1/form/646483eb-0895-47d1-9b14-cc8fb0bf835c'
    * def username = '<Email>'
    * def password = '<Password>'
   When call read('classpath:../Authentication/getToken.feature')
   And header Authorization = 'Bearer '+AccessToken
   When method get
   And print "--------------------------------------------------------"
   Then status 200
   Then assert response.response[0].name == RequestBody.name
   Then print response



    Examples:
   |datasheet|
