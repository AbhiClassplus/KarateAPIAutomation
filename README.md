# Karate Framework
- only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework

Technologies/Tools used in building the framework
=================================================
- Eclipse - IDE
- karate library
- Maven - Build automation tool
- Java - Programming language
- GitHub - Version control
- Jenkins - running scripts with CI/CD

Framework implements below best practices
=========================================
- Code reusability
- Code readability
- Scalable automation (demonstrated using multiple test classes)
- Uses waits
- Assertions
- Running test scripts 

#HOW TO RUN PROJECT:
- Go to com.karate.runner package (for running API tests)
- Go to API_testRunner.feature file
- Run through command line (mvn clean test -Dtest=API_TestRunner)
- Go to com.karate.uirunner package (for running UI tests)
- Go to TestUIRunner.feature file
- Run through command line (mvn clean test -Dtest=TestUIRunner)

#HOW TO GET REPORTS
- After running the api & ui feature files
- Refresh the project 
- go to target folder
- go to cucumber-html-reports
- open overview-features.html file
