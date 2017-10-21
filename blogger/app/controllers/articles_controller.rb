class ArticlesController < ApplicationController
	#questo e' il controller
	# all'inizio si crea vuoto e te lo vai a riempire con i metodi tipo:



	def index    #questo e' il metodo index che vedi a dx quando lanci rake routes
				 #senza definirlo quando vai su http://localhost:3000/articles/ avresti errore
				 #"articles" (prima colonna a sx) vuole definito il metodo "index" (ultima a dx) per 
				 #funzionare
  		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

end



=begin

Within the controller, we have access to a method named params which returns us a hash of the 
request parameters. Often we’ll refer to it as "the params hash", but technically it’s "the params
 method which returns a hash".
Within that hash we can find the :id from the URL by accessing the key params[:id]. 
Use this inside the show method of ArticlesController along with the class method find on the 
Article class

la parola azzura Article e' la classe che hai creato all'inizio di tutto con il comando
bin/rails generate model Article
We’re running the generate script, telling it to create a model, and naming that model Article.
 From that information, Rails creates the following files:

db/migrate/(some_time_stamp)_create_articles.rb : A database migration to create the articles table
app/models/article.rb : The file that will hold the model code
test/models/article_test.rb : A file to hold unit tests for Article
test/fixtures/articles.yml : A fixtures file to assist with unit testing
With those files in place we can start developing!

cioe' ti crea tutta sta roba, pazzesco

Instance Variables

What is that "at" sign doing on the front of @articles? That marks this variable as an 
"instance level variable". We want the list of articles to be accessible from both the controller 
and the view that we’re about to create. In order for it to be visible in both places it has to 
be an instance variable. If we had just named it articles, that local variable would only be available 
within the index method of the controller.

A normal Ruby instance variable is available to all methods within an instance.

In Rails’ controllers, there’s a hack which allows instance variables to be automatically
transferred from the controller to the object which renders the view template. 
So any data we want available in the view template should be promoted to an instance variable 
by adding a @ to the beginning.

=end