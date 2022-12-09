*** Settings ***
Documentation       Suite de testes de autenticação
...                 Administrador deve acessar o portal de gestão de academias

Resource            ../resources/keywords.resource


*** Test Cases ***
Login do administrador
    Go To Login Page
    Fill Credenciais    admin@smartbit.com    qacademy

    # Fill Text    css=input[name=email]    admin@smartbit.com
    # Fill Text    css=input[name=password]    qacademy

    # Duas formas diferentes para encontrar texto de um elemento:
    # Click    xpath=//button[text()="Entrar no sistema"]
    # Click    text=Entrar no sistema

    Submit Credenciais
    User Should Be Logged In    Admin

Email não cadastrado
    Go To Login Page
    Fill Credenciais    404@smartbit.com    qacademy
    Submit Credenciais
    Click    css=button >> text=Entrar no sistema
    Verify Toaster

Senha inválida
    Go To Login Page
    Fill Credenciais    admin@smartbit.com    abc123
    Submit Credenciais
    Verify Toaster
