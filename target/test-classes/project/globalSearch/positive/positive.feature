# new feature
# Tags: optional

Feature: Global Search

    Background:
        * url BaseUrl
        * def body = read('classpath:baserequest/globalSearch.json')
        * def datasheet = read('classpath:testData/globalSearch/positive/scenario.csv')

    Scenario Outline: <scenarioDescription>

        Given path '<endpoint>'
        When request body
        * def username = '<username>'
        * def password = '<password>'
        * def user_pool = '<user_pool>'
        * def client_id = '<client_id>'
        And set body.customStatus = '<customStatus>'
        And set body.endDate = '<endDate>'
        And set body.interviewStatus = '<interviewStatus>'
        And set body.nationality = '<nationality>'
        And set body.organizationId = '<organizationId>'
        And set body.pageNumber = <pageNumber>
        And set body.pageSize = <pageSize>
        And set body.project = '<project>'
        And set body.projectStatus = '<projectStatus>'
        And set body.ratersCompleted = '<ratersCompleted>'
        And set body.searchTerm = '<searchTerm>'
        And set body.startDate = '<startDate>'
        And set body.userProfileId = '<userProfileId>'
        And call read('getToken.feature')
        And header Authorization = 'Bearer '+AccessToken
        When method post
        And print response
        Then status 200
        Examples:
        |datasheet|
