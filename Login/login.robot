*** Setting ***
Library             Selenium2Library
Test Setup          Open Chrome Browser
Test Teardown       Close Browser

*** Test Case ***
Login Success
    [Template]      Username        Password
                    USER            PASS                                        # Login success with username upper-case and password upper-case
                    user            PASS                                        # Login success with username lower-case and password upper-case

    Input Text                      user-id                     ${Username}
    Input Text                      pass-id                     ${Password}
    Click Button                    login-id
    Wait Until Page Contains        สวัสดี,ชาวโลก


Login Fail
    [Template]      Username        Password        Message
                    USER            pass            Invalid password!!          # Login fail with username upper-case and password lower-case
                    user            pass            Invalid password!!          # Login fail with username lower-case and password lower-case
                    USER            ${EMPTY}        Empty password!!            # Login fail with username upper-case and empty password
                    user            ${EMPTY}        Empty password!!            # Login fail with username lower-case and empty password
                    ${EMPTY}        PASS            Empty username!!            # Login fail with empty username and pass upper-case
                    ${EMPTY}        pass            Empty username!!            # Login fail with empty username and pass upper-case

    Input Text                      user-id                     ${Username}
    Input Text                      pass-id                     ${Password}
    Click Button                    login-id
    Wait Until Page Contains        ${Message}


*** Keyword ***
Open Chrome Browser
    Open Browser                    http://localhost    browser=gc
