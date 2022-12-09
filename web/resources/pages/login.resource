*** Settings ***
Library     Browser


*** Keywords ***
Go To Login Page
    New Browser    headless=true    browser=Chromium
    New Page    http://localhost:3000

Fill Credenciais
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[placeholder="Seu e-mail"]    ${email}
    Fill Text    css=input[placeholder="Sua Senha"]    ${pass}

Submit Credenciais
    Click    css=button >> text=Entrar no sistema

Field Type Should Be Email
    Get Attribute
    ...    css=input[placeholder="Seu e-mail"]
    ...    Type    equal    email

Alert Text Should Be
    [Arguments]    ${field}    ${expected_text}

    Get Text    xpath=//input[@type="${field}"]/..//span
    ...    equal    ${expected_text}

    # Wait For Elements State
    # ...    css=span >> text=${expected_text}
    # ...    visible    5
