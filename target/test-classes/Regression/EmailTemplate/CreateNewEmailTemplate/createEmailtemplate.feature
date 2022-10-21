Feature: Create new email Template
  Background:
    * def datasheet = read('data.csv')
    * def body1 = read('body1.json')
    * def extractor = Java.type("common.Config")
    * def date = new extractor().todaysDateTime()
    * def MailsacClass = Java.type("common.MailsacManipulation")

    @EmailTemplate
    Scenario Outline: Create email template
      Given url 'https://api.uatwamly.co.za/wamly/v1//templates/<organizationId>/create'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then body1.emailContent = date +' <emailContent>'
      Then body1.name = '<name> '+ date
      Then body1.subjectLine = '<subjectLine> ' + date
      Then body1.invitation = <invitation>

      And request body1
      And method post
      Then status 200
      Then print response

      * def templateID = response.response.id
      * def subjectLine = response.response.subjectLine
      * def temp = call read('classpath:../Regression/CreateProject/CreateProject.feature') {templateId: '#(templateID)'}
      * java.lang.Thread.sleep(5000)

      Given url 'https://mailsac.com/api/addresses/marcelm@mailsac.com/messages'
      When header Mailsac-Key = 'k_7xXTJsFZN8lHJBlaZvxAp7tfmn1t1eE38'
      Then method get
      And print response
      * def subj = response
      * def subject = body1.subjectLine
      * def MailsacMethod = MailsacClass.getEmailId(subject,response)
      Given url 'https://mailsac.com/api/text/marcelm@mailsac.com/'+MailsacMethod
      When header Mailsac-Key = 'k_7xXTJsFZN8lHJBlaZvxAp7tfmn1t1eE38'
      Then method get
      Then print response

      * def fun = function() {for(var i = 0; i < subj.length;i++){if(subj[i].subject === subjectLine)return subj[i].subject;}}
      Then status 200
      And match subj[*].subject contains fun()
      And print response
      Examples:
      |datasheet|