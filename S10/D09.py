from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.option import Options
import time
options = Options()

#options.add_argument("--headless"=new) #mode sans fenetre visible
options.add_argument("--no-sandbox") #pour eviter les erreurs de permission
options.add_argument("--disable-dev-shm-usage") #pour eviter les erreurs de memoire

driver = webdriver.Chrome(options=options)

url_depart = "https://example.com"
driver.get(url_depart)

lien = driver.find_element(By.TAG_NAME, "a")
lien_href = lien.get_attribute("href")
print(lien_href)

time.sleep(2)
lien.click()
time.sleep(5)

#pas à l'examen, juste demo 