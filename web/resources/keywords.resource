*** Settings ***
Library     Browser


*** Keywords ***
Go To Login Page
    New Browser    headless=false    browser=Chromium
    New Page    http://localhost:3000

Fill Credenciais
    [Arguments]    ${email}    ${pass}

    Fill Text    css=input[placeholder="Seu e-mail"]    ${email}
    Fill Text    css=input[placeholder="Sua Senha"]    ${pass}

Submit Credenciais
    Click    css=button >> text=Entrar no sistema

Verify Toaster
    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=Suas credenciais são inválidas, por favor tente novamente!
    ...    visible    5

User Should Be Logged In
    [Arguments]    ${user_name}
    ${logged_user}    Set Variable    css=aside strong
    Wait For Elements State    ${logged_user}    visible    5
    Get Text    ${logged_user}    equal    ${user_name}
