Feature: UI Test Demo 

Background: 
	* configure driver = { type: 'chromedriver' }
	Given driver 'http://wl-ui-1.staging.classplus.co/newApp/login'
	And driver.maximize() 
	And input("//input[@data-cy='login_orgCode']", "clp") 
	And click("//input[contains(@data-cy,'login_email')]")
	And input("//input[contains(@data-cy,'login_email')]","engineering@classplus.co") 
	And  delay(2000)
	And click("//button[@data-cy='login_continue']") 
	And delay(2000)
	And input("#otp_input","8888") 
	And click("//button[.='Verify OTP']") 
	Then driver.url == 'http://wl-ui-1.staging.classplus.co/batches'

Scenario: batch announcement  
    And delay(2000)
	And click('{}+ Create Batch')
	And input('input[name=batchName]', 'Hackathon Demo')
	And click("//button[.='Create Batch']")
	And delay(3000)
	And waitFor('{}Batch created successfully')

Scenario: add course and subjects
	Given driver.url == 'http://wl-ui-1.staging.classplus.co/batches'
	And delay(2000)
	And click('{}Hackathon')
	And click('{}Add Course')
	And click('{}Select Category')
	And click('{}Competitive')
	And click('{}Select Course')
	And delay(2000)
	And click('{}DS & Algo')
	And click('{}Select Subjects')
	And click('{}Algorithms')
	Then click('{}Done')
	And delay(3000)
	And And waitFor('{}SUCCESS')

Scenario: add students manually
	Given driver.url == 'http://wl-ui-1.staging.classplus.co/batches'
	And click('{}Hackathon')
	And click('{}Students')
	And click('{}Add Students')
	And click('{}Add Students Manually')
	And click('{}Add Another student') 
	And delay(3000)
	And input("//input[@name='members[0].name']", 'Rohit')
	And input("//input[@name='members[0].mobile']", '8020604474') 
	And input("//input[@name='members[1].name']", 'Mohit')
	And input("//input[@name='members[1].mobile']", '8020604475') 
	And click('#submit')
	And delay(2000)
	And waitFor('{}SUCCESS')
	
 Scenario: create class tests
	Given driver.url == 'http://wl-ui-1.staging.classplus.co/batches'
	And click('{}Hackathon')
	And click('{}Tests')
	And click('{}Create Test')
	And waitFor('{}Select Students') 
	And click('{a}Select All')
	And waitForEnabled('{}Next step').click()
	And waitFor('{}Create test')
	And delay(2000)
	And click('{}Practice Test')
	And click('{}Class test')
	And input('input[name=name]', 'Class Test 2') 
	And delay(2000)
	And click("//button[starts-with(text(),'Create test')]")
	And delay(2000)
	And screenshot()
	
Scenario: create online tests
	Given driver.url == 'http://wl-ui-1.staging.classplus.co/batches'
	And click('{}Hackathon')
	And click('{}Tests')
	And click('{}Create Test')
	And waitFor('{}Select Students') 
	And click('{a}Select All')
	And waitForEnabled('{}Next step').click()
	And waitFor('{}Online test')
	And delay(2000)
	And click('{}Practice Test')
	And click('{}Online test')
	And click('{}Select Subject')
	And delay(2000)
	And click('{}Algorithms')
	And click('{}Select chapter')
	And delay(2000)
	And click('{}Algorithms') 
	And waitFor('{}Select test')
	And click("//div[@class='ui fitted radio checkbox']")
	And click("//button[.='Done']")
	And delay(3000)
	#And locateAll('.ui mini fluid icon input form-control')[2].click()
	#And click('{}')
	And input('input[name=numberOfAttempts]', '2') 
	And delay(2000)
	And scroll('{}Send result on SMS')
	And click("//button[starts-with(text(),'Create test')]")
	And delay(2000)
	And screenshot()
	
	
	
