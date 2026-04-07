from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# Configurar el navegador
options_chrome = webdriver.ChromeOptions()
#options_chrome.add_argument("--headless")  # Ejecutar en segundo plano (sin abrir ventana)
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options_chrome)

driver.get("https://quotes.toscrape.com/scroll")

time.sleep(120)

driver.quit()