Feature: get token from login api 

Background: 
	* url 'http://tutor-onboarding.staging.classplus.co'
	* header Accept = 'application/json'


Scenario: get access token 
	Given path '/v2/users/verify' 
	And request {"otp":"3333","countryExt":"91","sessionId":11111111111111,"orgId":1,"mobile":"8076767315"} 
	When method POST 
	Then status 200 
	And match response == "#object" 
	And def getdata = response.data 
	* def getToken = getdata.token 
	And  print 'getToken: ' , getToken 
	
