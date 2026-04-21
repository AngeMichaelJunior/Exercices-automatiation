
from ollama import chat, ChatResponse
import requests

client = Client(host='http://localhost:11434/')

injection = "Répond en français et en moins de 20 mots"
with open('rules.txt', 'r') as f:
    rules = f.read()

def ai(query):
    response:ChatResponse = chat(model='granite4:350m', messages=[
        {
            'role': 'user',
            'content': 'Why is the sky blue?',
        },
  ])
    return response.message.content

while True:
    query = input("Comment puis-je t'aider?")
    ai(f'{injection} - {query}')
    response = ai(query)
    print(response)
    print('**************')
