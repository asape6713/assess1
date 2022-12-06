import psycopg2
conn = psycopg2.connect(
   host="localhost",
   port=5432,
   database="assessmentdb.sql",
   user="postgres",
   password="Vera1234?"
)
# use list, insert, delete
def read_contacts(C):
    cur = C.cursor()
    cur.execute("SELECT id, first_name, last_name, title, organization;")
    rows = cur.fetchall()
    cur.close()
    return rows
def insert_contacts(C, id, first_name, last_name, title, organization):
    cur = C.cursor()
    cur.execute(f"INSERT INTO contacts (id, first_name, last_name, title, organization) VALUES ('{id}', '{first_name}','{last_name}','{title}','{organization}');")
    cur.close()
def delete_id(C, id):
    cur = C.cursor()
    cur.execute(f"DELETE FROM contacts WHERE id = '{id}';")
    cur.close()
def save_contacts(C):
    cur = C.cursor()
    cur.execute("COMMIT;")
    cur.close()

while True: ## REPL - Read Execute Program Loop
    cmd = input("Command: ")
    if cmd == "list":
        print(read_contacts(conn))
    elif cmd == "insert":
        id =input("  id: ")
        first_name = input("  first_name: ")
        last_name= input("  last_name: ")
        title= input("  last_name: ")
        organization= input("  last_name: ")
        insert_contacts(conn, id, first_name, last_name, title, organization)
    elif cmd == "delete":
        id = input("  ID: ")
        delete_id(conn, id)
    elif cmd == "quit":
        save_contacts(conn)
        exit()
