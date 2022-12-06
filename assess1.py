mport psycopg2
conn = psycopg2.connect(
   host="localhost",
   port=5432,
   database="assessmentdb",
   user="postgres",
   password="Vera1234?"
)
# use list, add, delete
def read_contacts(C):
    cur = C.cursor()
    cur.execute("SELECT id, first_name, last_name, title, organization;")
    rows = cur.fetchall()
    cur.close()
    return rows
def add_word(C, id, first_name, last_name, title, organization):
    cur = C.cursor()
    cur.execute(f"INSERT INTO contacts (id, first_name, last_name, title, organization) VALUES ('{word}', '{translation}');")
    cur.close()
def delete_word(C, ID):
    cur = C.cursor()
    cur.execute(f"DELETE FROM dictionary WHERE id = '{ID}';")
    cur.close()
def save_dict(C):
    cur = C.cursor()
    cur.execute("COMMIT;")
    cur.close()

while True: ## REPL - Read Execute Program Loop
    cmd = input("Command: ")
    if cmd == "list":
        print(read_dict(conn))
    elif cmd == "add":
        name = input("  Word: ")
        phone = input("  Translation: ")
        add_word(conn, name, phone)
    elif cmd == "delete":
        ID = input("  ID: ")
        delete_word(conn, ID)
    elif cmd == "quit":
        save_dict(conn)
        exit()
