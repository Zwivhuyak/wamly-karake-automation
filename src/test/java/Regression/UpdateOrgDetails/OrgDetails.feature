Feature: Organization
  Background:
    * def datasheet = read('data.csv')
    * def json = read('body.json')
    * def extractor = Java.type("common.Config")
    * def date = new extractor().todaysDateTime()

  @absa
  Scenario Outline: Update Org Details

    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/f4312418-e16b-4b94-8e6a-e4b11156c56d/details'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    And request json
    When json.address.line1 = 'line1b'+new extractor().todaysDateTime()
    When json.address.line2 = 'line2'+new extractor().todaysDateTime()
    When json.address.city = 'city'+new extractor().todaysDateTime()
    When json.address.country = 'country'+new extractor().todaysDateTime()
    When json.address.suburb = 'suburb'+new extractor().todaysDateTime()
    When json.address.postalCode = 'code'+new extractor().todaysDateTime()

    When json.postalAddress.line1 = 'line1'+new extractor().todaysDateTime()
    When json.postalAddress.line2 = 'line2'+new extractor().todaysDateTime()
    When json.postalAddress.city = 'city'+new extractor().todaysDateTime()
    When json.postalAddress.country = 'country'+new extractor().todaysDateTime()
    When json.postalAddress.suburb = 'suburb'+new extractor().todaysDateTime()
    When json.postalAddress.postalCode = 'code'+new extractor().todaysDateTime()
    Then method put
    Then match response.response.address.line1 != response.response.postalAddress.line1
    Then match response.response.address.line2 != response.response.postalAddress.line2
    Then match response.response.address.city != response.response.postalAddress.city
    Then match response.response.address.country != response.response.postalAddress.country
    Then match response.response.address.suburb != response.response.postalAddress.suburb


    Examples:
      |datasheet|