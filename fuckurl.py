import requests


url = 'https://127.0.0.1/log.txt'

r = requests.get(url,verify=False)
html=r.content
html_doc=str(html,'utf-8')
print(html_doc)
