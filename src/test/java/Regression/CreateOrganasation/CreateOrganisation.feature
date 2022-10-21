Feature: hdhhdhd
  Background:
    * def datasheet = read('data.csv')
    * def RequestBody = read('body.json')


  @Regression
  Scenario Outline: Create Organazation named :
    Given url 'https://api.uatwamly.co.za/wamly/v1/organization'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When request RequestBody
    Then RequestBody.organizationName = '2BEDELETED'
    Then RequestBody.registeredName = '<organizationName>'
    Then RequestBody.subscription = '<subscription>'
    Then RequestBody.distributor = '<distributor>'
    Then RequestBody.isPostalSameAsPhysical = '<isPostalSameAsPhysical>'
    Then RequestBody.systemManagers[0].email = 'lucky011@cmdq.co.za'
    Then print RequestBody
    Then method post
    Then status 201
    * def new_org_id = response.response.id
    Then print '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'

    Examples:
    |datasheet|