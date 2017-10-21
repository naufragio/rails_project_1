#http://tutorials.jumpstartlab.com/projects/blogger.html capitolo 10
#Working with the Database
#Rails uses migration files to perform modifications to the database.
#qua e' definita la migrataion CreateArticles
#andiamo a modificare il database con questa migration aggiungendo due colonne (title,body)
# obiettivo: We’ve now created the articles table in the database and can start working on our Article model.

class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title  #aggiungiamo al nostro database la colonna title di tipo string e la colonna body
      t.text :body

      t.timestamps
=begin
What is that t.timestamps doing there? It will create two columns inside our table named
 created_at and updated_at. Rails will manage these columns for us. When an article is 
 created its created_at and updated_at are automatically set. Each time we make a change to the 
 article, the updated_at will automatically be updated.
=end
    end
  end
end

#dando en el terminal bin/rake db:migrate We’ve now created the articles table in
# the database and can start working on our Article model.