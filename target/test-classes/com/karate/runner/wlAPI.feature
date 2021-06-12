Feature: Automate Tutor & Student API's 

Background: 

# stagging
	* url 'http://tutor-onboarding.staging.classplus.co'
    * def batch_Id = '2744'
    * def batch_TestId = '600565'
    * def batch_code = 'ctb3uyhs'
    * def assign_Id = '1327'
    * def stud_Id = '10153'
    * def org_Id = '1'
    * def profile_Id = '1058'
    * def myFeature = call read('getToken.feature')
    * def authToken = myFeature.getToken

Scenario: get users details 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/users/details' 
	And header x-access-token = authToken 
	And print 'getToken: ', authToken 
	And header Content-Type = 'application/json' 
	When method GET 
	Then status 200 
	And def reponseMessage = response.status 
	
	#Live Session
Scenario: Create live session 
	Given path 'v2/live/classes/createSession' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"entityId": 2236, "type": 3, "title": "New Live Video", "expectedStudents": 2, "expectedDuration": 900,"expectedStudents": 2,"isSchedule": 0,"isWeb": 0,"scheduleTime": null,"sendSms": 0,"showVideoOnWeb": 0,"title": "New Live Video","type": 3} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Successfully Initiated Live Session" 
	
	
Scenario: get org details 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/users/details' 
	And header x-access-token = authToken 
	And print 'getToken: ', authToken 
	And header Content-Type = 'application/json' 
	When method GET 
	Then status 200 
	And def reponseMessage = response.status 
	And print reponseMessage 
	And match reponseMessage == "success" 
	
	
Scenario: delete details of assignments 
	Given url 'http://tutor-onboarding.staging.classplus.co/v3/homework/delete/1365' 
	And header x-access-token = authToken 
	And print 'getToken: ', authToken 
	And header Content-Type = 'application/json' 
	And param assignmentId = assign_Id 
	When method DELETE 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "assignment deleted sucessfully" 
	
Scenario: get student details of assignments 
	Given url 'http://tutor-onboarding.staging.classplus.co/v3/homework/1370/students' 
	And header x-access-token = authToken 
	And print 'getToken: ', authToken 
	And header Content-Type = 'application/json' 
	And param assignmentId = assign_Id 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "students listed successfully" 
	
	
Scenario: add course 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batch/courses' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And param categoryId = 2 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Batch courses fetched successfully" 
	
Scenario: add subject 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batch/subjects' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And param courseId = 273 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Query Successful" 
	
Scenario: Create batch timings 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batches/class' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"batchId":2747,"subjectId":549,"facultyId":453733,"timings":[{"day":4,"classTimings":[{"start":"19:40","end":"21:00"}]}]} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Class created successfully!" 
	
Scenario: Edit batch details 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batches/jdef0dfhqwdg/edit' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"batchName":"NEW API AUTOMATION","batchCode":"jdef0dfhqwdg","subjectIds":[549],"batchStartDate":"2021-06-10","categoryId":2,"courseId":273} 
	When method PATCH 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Batch updated successfully!" 
	
	
Scenario: Delete batch timings 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batch/class/2822' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	When method DELETE 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Class removed successfully!" 
	
Scenario: import study material in batch 
	Given url 'http://tutor-onboarding.staging.classplus.co/v3/batches/import' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"parentFolderId":0,"oldBatchId":"1342","newBatchId":"2752","newBatchCode":"sfsgwefkjh","isAllSeleccted":0,"selectedArrays":{"folderIds":[],"docIds":[2091,1891]},"type":"study_material"} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "study_material copied sucussfully" 
	
Scenario: notify student to submit assignment 
	Given url 'http://tutor-onboarding.staging.classplus.co/v3/homework/notifyGenerate' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"assignmentId":"1378","selectedStudent":89518} 
	And param assignmentId = 1378 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Success! Reminder sent successfully as notification!" 
	
Scenario: add students from app downloads 
	Given url 'http://tutor-onboarding.staging.classplus.co/batches/sfsgwefkjh/students' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"studentContacts":[{"name":"testing stdnt","mobile":"918574560005"}]} 
	When method POST 
	Then status 201 
	And def reponseMessage = response.message 
	And match reponseMessage == "Successfully added students to the batch" 
	
Scenario: Create Announcement 
	Given url 'http://tutor-onboarding.staging.classplus.co/batches/sfsgwefkjh/announcements' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {description: "Testing Hack", sendSMS: 0, attachments: []} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Announcement added successfully" 
	
Scenario: Create class test 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batches/tests' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"batchCode":"sfsgwefkjh","testType":"offline","sendSMS":1,"testName":"HackTEST","testTime":"2021-06-11 02:32:27","selectedIdArray":[],"isAllSelected":1,"unselectedIdArray":[],"isResultViaSms":0,"isResultVisible":1,"resultVisibilityTime":"2021-06-11 02:32:27"} 
	When method POST 
	Then status 201 
	And def reponseMessage = response.message 
	And match reponseMessage == "Added test successfully" 
	
Scenario: Create practice test 
	Given url 'http://tutor-onboarding.staging.classplus.co/v3/batches/tests/create' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"batchId":2752,"selectedIdArray":[],"isAllSelected":1,"unselectedIdArray":[],"attachments":[{"attachment":"https://whitelabel-assets.s3.ap-south-1.amazonaws.com/staging/single/clp/6886087e-ea8f-4c8e-af76-f590dc6ab746.jpeg","fileName":"WhatsApp Image 2021-04-15 at 22.48.32.jpeg","public_id":"uJnqWGG3jPVqh7HUBC98","type":"jpeg"}],"totalQuestions":3,"correctMarks":4,"incorrectMarks":-1,"maxMarks":12,"testName":"testHACK","testDuration":3600000,"startTestTime":"2021-06-11 01:00:23","testTime":null,"sendSMS":0} 
	When method POST 
	Then status 200 
	And print response 
	And def reponseMessage = response.message 
	And match reponseMessage == "Successfully created Practice Test." 
	And def responseCMSTestId = response.data.cmsTestId 
	And print responseCMSTestId 
	And url 'http://tutor-onboarding.staging.classplus.co/v3/batches/tests/set-answer-keys' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"testId":responseCMSTestId,"questions":[{"_id":"60c262f9af2faf867371a343","answer":"60c262f9af2faff60971a33f"},{"_id":"60c262f9af2fafed8771a34d","answer":"60c262f9af2faf26fd71a349"},{"_id":"60c262f9af2fafb0c771a348","answer":"60c262f9af2faf2c7671a344"}]} 
	When method POST 
	Then status 200 
	And print response 
	And def reponseMessage1 = response.message 
	And match reponseMessage1 == "Answer keys updated!" 
	
Scenario: Create online test 
	Given url 'http://tutor-onboarding.staging.classplus.co/v2/batches/tests' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"batchCode":"qsb9lr3i","testType":"online","sendSMS":1,"startTestTime":"2021-06-10 03:16:12","testTime":"2027-06-12 03:16:12","selectedIdArray":[],"isAllSelected":1,"unselectedIdArray":[],"numberOfAttempts":3,"isResultViaSms":0,"isResultVisible":1,"resultVisibilityTime":"2021-06-12 03:16:12","testId":4392} 
	When method POST 
	Then status 201 
	And print response 
	And def reponseMessage = response.message 
	And match reponseMessage == "Added test successfully" 
	
	# Tutor - Enquiry Tab
Scenario: Create enquiry 
	Given path '/enquiries' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"sendSMS":1,"createdAt":"2021-03-23","name":"Rishab","mobile":"9828998998","assignedLead":12312365,"subject":"Programming","source":"Justdial","followUpType":"call","status":"high","notes":"NOTES","followUpAt":"2021-03-25 01:00:00"} 
	When method POST 
	Then status 201 
	And def reponseMessage = response.message 
	And match reponseMessage == "Enquiry added successfully" 
	
Scenario: get enquiry signed url 
	Given path 'v2/enquiries/signedUrl' 
	And header x-access-token = authToken 
	And print 'getToken: ', authToken 
	And header Content-Type = 'application/json' 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Fetched successfully" 
	
Scenario: sms length 
	Given path 'v3/utilities/sms_length' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"message":"hi","type":"TYPE_ENQUIRY_SMS"} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "success" 
	
Scenario: send enquiry sms 
	Given path 'v2/enquiries/message' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"enquiryIdArray":[7742],"messageText":"hi"} 
	When method POST 
	Then status 201 
	And def reponseMessage = response.message 
	And match reponseMessage == "Message sent successfully" 
	
Scenario: add assignee 
	Given path 'v2/tutors/register' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"name":"Assignee Name 1","contact":{"mobile":"9803908811","countryCode":"91"}} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Successful" 
	
Scenario: add course 
	Given path 'v2/batch/courses' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And param categoryId = 2 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Batch courses fetched successfully" 
	
Scenario: add subject 
	Given path 'v2/batch/subjects' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And param courseId = 272 
	When method GET 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Query Successful" 
	
	#Zoom
Scenario: get Zoom profile 
	Given path '/v3/zoom/profile' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {} 
	When method GET 
	Then status 200 
	And def getData = response.data 
	And def getZoomUrl = getData.zoomUrl 
	And	print 'getZoomUrl :' , getZoomUrl 
	And def reponseMessage = response.message 
	And match reponseMessage == "User zoom profile" 
	
Scenario: create Zoom profile 
	Given path '/v3/zoom/profile' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {"zoomUrl": "https://us04web.zoom.us/j/2369879707?pwd=dHBCZEowUk5rekFPUlVUeEswdEZSZz09"} 
	When method POST 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Zoom profile created successfully" 
	
	
Scenario: update Zoom Session 
	Given path '/v3/zoom/session/123' 
	And header x-access-token = authToken 
	And header Content-Type = 'application/json' 
	And request {} 
	When method PATCH 
	Then status 200 
	And def reponseMessage = response.message 
	And match reponseMessage == "Session ended"