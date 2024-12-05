# Configurando o Projeto

Os passos iniciais para setar esse projeto.

## **Parte 1: Criar um projeto Django simples.**

### 1. Criar o Ambiente Virtual Python
Criar e ativar um `Ambiente Virtual` para isolar as dependências do projeto.

Criar
```bash
python -m venv venv
```

Ativar
```bash
source venv/bin/activate  # Para Unix/MacOS
.\venv\Scripts\activate   # PAra Windows
```

### 2. Instalar o Django
```bash
pip install django
```

### 3. Iniciar o Projeto Django
```bash
django-admin startproject core .
```

### 4. Configurar o Banco de Dados
Antes de rodar o servidor pela primeira vez, aplique as migrações iniciais, ele irá criar um pequeno banco de dados em `sqlite3`:
```bash
python manage.py migrate
```

### 5. Testar o Servidor de Desenvolvimento
```bash
python manage.py runserver
```
Acesse `http://127.0.0.1:8000/` ou `http:localhost:8000` no navegador para verificar a página inicial padrão do Django. Você verá uma página 

---

## **Criando a Primeira Página Personalizada Simples**

### 1. Criar o Arquivo `views.py`
Crie o arquivo `views.py` (mesmo nível que `settings.py`) e adicione uma função para renderizar uma página HTML.

#### Exemplo (`views.py`):
```python
from django.shortcuts import render

def home(request):
    return render(
        request=request,
        template_name='index.html',
    )
```

### 2. Criar a Pasta de Templates
Crie uma pasta chamada `templates` (mesmo nível que `settings.py`). Dentro dela, crie o arquivo `index.html` (ou outro nome que preferir).

#### Como ficará a estrutura do Projeto:
```
└── 📁core
    └── 📁templates
        └── index.html
    └── __init__.py
    └── asgi.py
    └── settings.py
    └── urls.py
    └── views.py
    └── wsgi.py
└── db.sqlite3
└── manage.py
```

### 3.1 Configurar o Template no `settings.py`
Adicione o caminho dos templates no arquivo `settings.py`, se ainda não estiver configurado, apenas alterar `DIRS`:
```python
TEMPLATES = [
    {
        ... # INICIO DO TEMPLATES...
        'DIRS': [BASE_DIR / "templates"],  # Certifique-se de que este caminho está configurado
        ... # RESTO DO TEMPLATES...
]
```

### 3.2 Configurar o App no `settings.py`
Dentro dos apps instalados é importante colocar o nome do seu projeto/app, nesse caso `core`
```python
INSTALLED_APPS += ['core']
```

### 4. Registrar a View no `urls.py`
No arquivo `urls.py`, importe a função criada no `views.py` e configure uma rota para ela.

#### Exemplo (`urls.py`):
```python
... INICIO DO `urls.py`
from . import views  # Importe o arquivo views.py
urlpatterns += [path('', views.home, name='home')]
```

## **Testando a Configuração**
Agora, reinicie o servidor de desenvolvimento:
```bash
python manage.py runserver
```
Acesse `http://127.0.0.1:8000/` no navegador. A página `index.html` localizada na pasta `templates` será renderizada.

## **Próximos Passos**

Em Breve...

Para mais informações, consulte a [documentação oficial do Django](https://docs.djangoproject.com/).

