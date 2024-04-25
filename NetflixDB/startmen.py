import psycopg2
import sys

# Define the connection parameters to the PostgreSQL database
DATABASE = "NeflixDB"
USER = "postgres"
PASSWORD = "0828"
HOST = "localhost"

# Function to connect to database
def get_connection():
    return psycopg2.connect(database=DATABASE, user=USER, password=PASSWORD, host=HOST)

# Function to execute query
def execute_query(sql, params=None, fetch=False, commit=False):
    conn = get_connection()
    try:
        cur = conn.cursor()
        cur.execute(sql, params or ())
        if commit:
            conn.commit()
            print("Operation successful.")
        if fetch:
            return cur.fetchall()
    except Exception as e:
        print(f"An error occurred: {e}")
        conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()

# Function to insert data into table
def insert_data():
    print("Inserting Netflix data...")
    conn = get_connection()
    try:
        cur = conn.cursor()
        # Collect movie data from user
        idmovie = int(input("Enter Movie/Series ID: "))
        title = input("Enter title: ")
        genre = input("Enter genre: ")
        tags = input("Enter tags: ")
        languages = input("Enter languages for Movie/Series: ")
        ty_type = input("Enter Movie or Series: ")
        runtime = input("Enter Movie/Series Runtime: ")
        boxoffice = int(input("Enter Box Office Numbers: "))
        fullname = input("Enter Director Full Name: ")
        actor_name = input("Enter Actor Full Name: ") 
        studio_name = input("Enter Production House: ")
        writer_name = input("Enter Writer Full Name: ")
        y_o_r = input("Enter Date of Release: ")
        netflix_release = input("Enter Netflix Date of Release: ")
        country = input("Enter Movie or Series Country: ")
        summary = input("Enter Movie/Series Summary: ")
        award_received = int(input("Enter Movie/Series Awards Received: "))
        hidden_gem = float(input("Enter Movie/Series Hidden Gem Rating: "))
        imdb = float(input("Enter Movie/Series IMDB Rating: "))
        viewer_rating = input("Enter Movie/Series Viewer Rating: ")
        director_id = int(input("Enter Movie/Series Director ID: "))
        studio_id = int(input("Enter Movie/Series Studio ID: "))
        writer_id = int(input("Enter Movie/Series Writer ID: "))
        idcasts = int(input("Enter Movie/Series Casts ID: "))
        idaward = int(input("Enter Movie/Series Award ID: "))
        actor_id = int(input("Enter Movie/Series Actor ID: "))
        idrating = int(input("Enter Movie/Series Rating ID: "))
	
        # Insert movie data
        sql_writer = """
        INSERT INTO Writer (writer_id, writer_name)
        VALUES (%s, %s);
        """
        cur.execute(sql_writer, (writer_id, writer_name))

        

        sql_award = """
        INSERT INTO Awards (idaward, award_received)
        VALUES (%s, %s);
        """
        cur.execute(sql_award, (idaward, award_received))

        sql_actor = """
        INSERT INTO Actor (actor_id, actor_name)
        VALUES (%s, %s);
        """
        cur.execute(sql_actor, (actor_id, actor_name))

        sql_studio = """
        INSERT INTO Productionhouse (studio_id, studio_name)
        VALUES (%s, %s);
        """
        cur.execute(sql_studio, (studio_id, studio_name))

        sql_direct = """
        INSERT INTO Director (director_id, fullname)
        VALUES (%s, %s);
        """
        cur.execute(sql_direct, (director_id, fullname))

        sql_movie_series = """
        INSERT INTO Movie (idmovie, title, genre, tags, languages,  ty_type, country, runtime,boxoffice,y_o_r,netflix_release,summary,director_id,studio_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);
        """
        cur.execute(sql_movie_series, (idmovie, title, genre, tags, languages,  ty_type, country, runtime, boxoffice, y_o_r, netflix_release, summary, director_id, studio_id))

        sql_ratings = """
        INSERT INTO Ratings (idrating, imdb, hidden_gem, viewer_rating)
        VALUES (%s, %s, %s, %s);
        """
        cur.execute(sql_ratings, (idrating, imdb, hidden_gem, viewer_rating))
        sql_casts = """
        INSERT INTO Casts (idcasts, idmovie, actor_id)
        VALUES (%s, %s, %s);
        """
        cur.execute(sql_casts, (idcasts, idmovie, actor_id))

        print("Netflix data inserted successfully.")

    except Exception as e:
        print(f"An error occurred: {e}")
        conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()

def delete_data():
    print("Select what to delete:")
    print("1. Delete by Movie ID")
    print("2. Delete by Movie Name")
    print("3. Delete by Director")
    print("4. Delete by Language")

    choice = input("Enter your choice 1-4: ")

    if choice == '1':
        idmovie = int(input("Enter Movie/Series ID to delete: "))
        sql = "DELETE FROM Movie WHERE idmovie = %s;"
        params = (idmovie,)
    elif choice == '2':
        title = input("Enter title to delete: ")
        sql = "DELETE FROM Movie WHERE title = %s;"
        params = (title,)
    elif choice == '3':
        fullname = input("Enter Director to delete: ")
        sql = "DELETE FROM Movie WHERE fullname = %s;"
        params = (fullname,)
    elif choice == '4':
        language = input("Enter language to delete: ")
        sql = "DELETE FROM Movie WHERE language = %s;"
        params = (laguage,)
    else:
        print("N/A choice.")
        return


    confirm = input(f"Are you sure you want to delete these records? (y/n): ")
    if confirm.lower() == 'y':
        execute_query(sql, params, commit=True)
        print("Data deleted successfully.")
    else:
        print("Deletion canceled.")

# Update Data Function
def update_data():
    idmovie = int(input("Enter Movie/Series ID to update: "))
    idrating = int(input("Enter Movie/Series Rating ID to update: "))

    print("Select the attribute to update:")
    print("1. Hidden Gem Score")
    print("2. Box Office Numbers")
    print("3. IMDB")
    print("4. netflix_release")

    choice = input("Enter your choice 1-4: ")

    if choice == '1':
        hidden_gem = float(input("Enter new Hidden Gem Score: "))
        sql = "UPDATE Ratings SET hidden_gem = %s WHERE idrating = %s;"
        params = (hidden_gem, idmovie)
    elif choice == '2':
        boxoffice = int(input("Enter new Box Office Revenue: "))
        sql = "UPDATE Movie SET boxoffice = %s WHERE idmovie = %s;"
        params = (boxoffice, idmovie)
    elif choice == '3':
        imdb = float(input("Enter new IMDB Score: "))
        sql = "UPDATE Ratings SET imdb = %s WHERE idrating = %s;"
        params = (imdb, idmovie)
    elif choice == '4':
        netflix_release = input("Enter new Netflix Release Date: ")
        sql = "UPDATE Movie SET netflix_release = %s WHERE idmovie = %s;"
        params = (netflix_release, idmovie)
    else:
        print("N/A choice.")
        return

    execute_query(sql, params, commit=True)
    print("Data updated successfully.")

# Search Data 
def search_data():
    print("Select the search criteria:")
    print("1. title")
    print("2. Movie ID")
    print("3. Country")

    choice = input("Enter your choice 1-3: ")

    if choice == '1':
        title_find = input("Enter title to find: ")
        sql = "SELECT * FROM Movie WHERE title ILIKE %s;"
        params = (f"%{title_find}%",)
    elif choice == '2':
        movieid_find = int(input("Enter Movie/Series ID to find: "))
        sql = "SELECT * FROM Movie WHERE idmovie = %s;"
        params = (movieid_find,)
    elif choice == '3':
        find_country = input("Enter country to find: ")
        sql = "SELECT * FROM Movie WHERE  ILIKE %s;"
        params = (f"%{find_country}%",)
    else:
        print("N/A choice.")
        return

    result = execute_query(sql, params, fetch=True)
    for r in result:
        print(r)

# Aggregate Function
def aggregate_functions():
    print("Select aggregate function to perform:")
    print("1. Average BoxOffice Revenue")
    print("2. Minimum BoxOffice Revenue")
    print("3. Maximum BoxOffice Revenue")
    print("4. Total Number of Movies")

    choice = input("Enter your choice 1-4: ")

    if choice == '1':
        sql = "SELECT AVG(boxoffice) FROM Movie;"
        out = "Average Box Office Revenue"
    elif choice == '2':
        sql = "SELECT MIN(boxoffice) FROM Movie;"
        out = "Minimum Box Office Revenue"
    elif choice == '3':
        sql = "SELECT MAX(boxoffice) FROM Movie;"
        out = "Maximum Box Office Revenue"
    elif choice == '4':
        sql = "SELECT COUNT(*) FROM Movie;"
        out = "Total number of Movies/Series"
    else:
        print("N/A choice.")
        return

    result = execute_query(sql, fetch=True)
    print(f"{out}: {result[0][0]}")

# Sorting Funtion
def sorting_data():
    print("Select a column to sort by:")
    print("1. Box Officce Revenue (Descending)")
    print("2. IMBD Rating (Descending) ")
    print("3. Movie (Alphabetical) ")
    print("4. Hidden Gem Score (Descending) ")

    choice = input("Enter your choice 1-4: ")

    if choice == '1':
        sql = "SELECT * FROM Movie ORDER BY boxoffice DESC;"
        out = "Movies/Series sorted by Box Office Revenue (Descending):"
    elif choice == '2':
        sql = "SELECT * FROM Ratings ORDER BY imdb DESC;"
        out = "Movies/Series sorted by IMDB RATING (Descending):"
    elif choice == '3':
        sql = "SELECT * FROM Movie ORDER BY title;"
        out = "Movies/Series sorted by Title (Alphabetical):"
    elif choice == '4':
        sql = "SELECT * FROM Ratings ORDER BY hidden_gem DESC;"
        out = "Movies/Series sorted by Hidden Gem Score (Descending):"
    else:
        print("N/A choice.")
        return

    result = execute_query(sql, fetch=True)
    print(out)
    for r in result:
        print(r)

# Join 
def perform_joins():
    Movie = input("Enter first table to join: ")
    Productionhouse = input("Enter second table to join: ")
    print("Select a type of join:")
    print("1. Left Join")
    print("2. Inner Join")
    choice = input("Enter your choice 1 or 2: ")

    if choice == '1':
        # SQL for a Left Join
        sql = "SELECT * FROM Movie a LEFT JOIN Productionhouse b ON a.studio_id = b.studio_id;"   
        out = "Left Join: "  
    elif choice == '2':
        # SQL for an Inner Join
        sql = "SELECT * FROM Movie a INNER JOIN Productionhouse b ON a.studio_id = b.studio_id;"
        out = "Inner Join:"
    else:
        print("N/A choice.")
        return

    result = execute_query(sql, fetch=True)
    print(out)
    for r in result:
        print(r)

    

# Grouping 
def perform_grouping():
    print("Select category to group by:")
    print("1. Group by Country")
    print("2. Group by Movie")
    print("3. Group by Date of Release")

    choice = input("Enter your choice 1-3: ")

    if choice == '1':
        # SQL for Grouping by Category
        sql = "SELECT country, COUNT(*) FROM Movie GROUP BY country;"
    elif choice == '2':
        # SQL for Grouping by Date
        sql = "SELECT ty_type, COUNT(*) FROM Movie GROUP BY ty_type;"
    elif choice == '3':
        # SQL for Grouping by Date
        sql = "SELECT y_o_r, COUNT(*) FROM Movie GROUP BY y_o_r;"

    else:
        print("N/A choice.")
        return

    result = execute_query(sql, fetch=True)  
    for r in result:
        print(r)

# Transactions Example
def manage_transaction():
    try:
        conn = get_connection()
        conn.autocommit = False
        cur = conn.cursor()
        cur.execute("INSERT INTO Ratings (idrating, hidden_gem) VALUES (55, 8.0);")
        cur.execute("UPDATE Ratings SET hidden_gem = hidden_gem + 1.5 WHERE idrating = 55;")
        
        
        conn.commit()
        print("Transaction completed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")
        conn.rollback()
    finally:
        if conn:
            cur.close()
            conn.close()

# Error Handling 
def handle_error():
    try:
        execute_query("SELECT * FROM Music;")
    except Exception as e:
        print(f"Handled error: {e}")

def sub_queries():
    print("Select Subquery to produce:")
    print("1. Movie to Studio")
    print("2. Movie to Director")
    print("3. Movie to Actor")

    choice = input("Enter your choice 1-3: ")

    if choice == '1':
        # SQL for Grouping by Category
        sql = "SELECT * FROM Movie WHERE studio_id IN (SELECT studio_id FROM Productionhouse);"
    elif choice == '2':
        # SQL for Grouping by Date
        sql = "SELECT * FROM Movie WHERE director_id IN (SELECT director_id FROM Director);"
    elif choice == '3':
        # SQL for Grouping by Date
        sql = "SELECT * FROM Movie WHERE actor_id IN (SELECT actor_id FROM Actor);"

    else:
        print("N/A choice.")
        return

    result = execute_query(sql, fetch=True)  
    for r in result:
        print(r)


# Main Menu Function
def main_menu():
    print("\nWelcome to the Database CLI Interface!")
    print("Please select an option:")
    print("1. Insert Data")
    print("2. Delete Data")
    print("3. Update Data")
    print("4. Search Data")
    print("5. Aggregate Functions")
    print("6. Sorting")
    print("7. Joins")
    print("8. Grouping")
    print("9. Subqueries")
    print("10. Transactions")
    print("11. Error Handling")
    print("12. Quit")
    
    choice = input("Enter your choice (1-12): ")
    return choice

def main():
    while True:
        choice = main_menu()
        if choice == '12':  # Quit is now option 12
            print("Exiting the program.")
            break  # Exit the loop to quit the program
        elif choice == '1':
            insert_data()
        elif choice == '2':
            delete_data()
        elif choice == '3':
            update_data()
        elif choice == '4':
            search_data()
        elif choice == '5':
            aggregate_functions()
        elif choice == '6':
            sorting_data()
        elif choice == '7':
            perform_joins()
        elif choice == '8':
            perform_grouping()
        elif choice == '9':
            sub_queries()
        elif choice == '10':
            manage_transaction()
        elif choice == '11':
            handle_error()
        else:
            print("Invalid option. Please try again.")

if __name__ == "__main__":
    main()
