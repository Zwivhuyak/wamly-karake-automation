Feature: Project Assertions
  Background:
    * def datasheet = read('classpath:testData/deleteApi/positive/INT/scenario.csv')
  Scenario Outline: Validate Project information

    And match response.response.data[*].projectName contains 'Form flow'
    And match response.response.data[*].dateCreated contains '2021-10-19'
    And match response.response.data[*].daysActive contains null
    And match response.response.data[*].lastModified contains null
    And match response.response.data[*].department contains 'Development'
    And match response.response.data[*].creator contains null
    And match response.response.data[*].introVidUsed contains false
    And match response.response.data[*].sendFromEmail contains ''
    And match response.response.data[*].replyTo contains 'lothar@commandquality.co.za'
    And match response.response.data[*].customTemplate contains false
    And match response.response.data[*].blur contains false
    And match response.response.data[*].hideCandidateDetails contains true
    And match response.response.data[*].notifyRaters contains false
    And match response.response.data[*].notifyAdmin contains false
    And match response.response.data[*].breather contains true
    And match response.response.data[*].totalCandidates contains 0
    And match response.response.data[*].totalInterviews contains 0
    And match response.response.data[*].practiceInterview contains 0
    And match response.response.data[*].totalQuestions contains 0
    And match response.response.data[*].totalRaters contains 0
    And match response.response.data[*].ratersCompleted contains 0.0


    Examples:
      |datasheet|