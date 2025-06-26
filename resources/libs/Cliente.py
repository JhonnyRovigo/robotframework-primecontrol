from faker import Faker
import random

fake = Faker('pt_BR')

PAISES = [
    "br", "us", "ca", "mx", "gb", "fr", "de", "it", "es", "jp", "au", "cn",
    "in", "ru", "za", "ar", "cl", "co", "pe", "nz", "ch", "se", "no", "dk",
    "nl", "be", "fi", "pt", "gr"
]

def get_fake_cliente():  # <- Nome com underscore!
    cliente = {
        "nome": fake.name(),
        "telefone": fake.phone_number(),
        "email": fake.email(),
        "cep": fake.postcode(),
        "numero": fake.building_number(),
        "endereco": fake.street_name(),
        "complemento": fake.text(max_nb_chars=20),
        "pais": random.choice(PAISES),
        "genero": random.choice(["Masculino", "Feminino", "Outros"]),
        "ferramentas": random.sample(["Robot Framework", "Selenium WebDriver", "Cypress", "Appium", "Protractor"], k=random.randint(1, 3))
    }
    return cliente