*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am in Suite Setup
Test Setup    Log    I am in Test Setup    
Test Teardown    Log     I am in Test Teardown
Suite Teardown    Log     I am in Suite Teardown


Default Tags    Sanity
*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    Hello World ...
    
MyFirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Air India Flight to India   
    #Press Keys    name=q    ESC
    Click Button    name=btnK
        
    Sleep    5    
    Close Browser
    Log    Test Completed
    
MySampleLoginTest
    [Documentation]    This is a basic test

    Open Browser    ${url}        chrome
    LoginKW
    Click Button    name=Submit
    Set Browser Implicit Wait    5
    Click Element    id=welcome
    LogoutKw
    Log    This test is executed by %{username} on OS %{os}

*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/   
@{credntials}    admin    admin123   
&{logindata}    userid=admin  


*** Keywords ***

LoginKW
    Input Text    id=txtUsername    ${logindata}[userid]
    Input Password    id=txtPassword    ${credntials}[1]
 
LogoutKw
    Click Element    link=Logout    
    Close Browser   

             