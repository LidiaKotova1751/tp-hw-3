import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Цена", "Рейтинг", "В наличии", "Категория"]

def generate_row():

    return {
        "Цена": random.randint(100, 10000),
        "Рейтинг": round(random.uniform(1.0, 5.0), 2),
        "В наличии": random.randint(0, 200),
        "Категория": random.choice(["Техника", "Одежда", "Книги"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

