class ArticlesController < ApplicationController
	include ArticlesHelper #questo aggiunto per quanto spiegato a Fragile Controllers

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

	def new
		@article = Article.new #questa e' la variabile che passiamo alla form nella view new.html.erb
		#senza questa variabile la form non funziona, da errore che spiea nella sezione "Does it Work?"
	end

	#questo metodo create e' quello che viene chiamato quando nella form fai "create article".
	#new e' per creare vuoto un nuovo articolo, creare e' per riempirlo
	#di fatti se togli questo metodo e fai "create article" apparira' l'errore 
	#"The action 'create' could not be found for ArticlesController"
	def create #questo potresti migliorarlo con tutto cio che spiega nel paragrafo "Fragile Controllers"
		@article = Article.new
  		@article.title = params[:article][:title]
  		@article.body = params[:article][:body]
  		@article.save
  		flash.notice = "Article '#{@article.title}' Created!" #paragrafo Adding a Flash
  		redirect_to article_path(@article) #Redirects to the article index page (article e' la ruta che scegli dall'elenco dei prefix di rake routes)
  	end	
  		#per create non creiamo una vista (un file.erb), cioe' un template, xke gia' abbiamo il template
  		#di show che mostra l'articolo specifico e ridirigiamo a quello
  		#We Don’t Always Need Templates
  		#When you click the "Create" button, what would you expect to happen? Most web applications 
  		#would process the data submitted then show you the object. In this case, display the article.
		#We already have an action and template for displaying an article, the show, so there’s no 
		#sense in creating another template to do the same thing.
		#quindi chiamiamo la vista show.html.erb che e' gia inroutata bene e dobbiamo solo ridirigirci la.

#We accessed the new action to load the form, but Rails’ interpretation of REST uses a
# second action named create to process the data from that form.
# cioe' con la new action accedi alla form per creare articolo, pero' secondo la convenzione REST
# si usa una secondaazione chiamata "create" per processare i dati inseriti nella form
# stessa cosa per le azioni edit e update
# Just like the new action sends its form data to the create action, the edit 
# action sends its form data to the update action.


	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' deleted!" #paragrafo "Adding a Flash"
		redirect_to articles_path(@article) #Redirects to the articles index page

	end

	def edit
 	   @article = Article.find(params[:id])
	end

	def update
  		@article = Article.find(params[:id])
  		@article.update(article_params)   #anche create quando ti rispiega come farlo bene utilizza questo article_params che hai definito in article_helper.rb (We use the same article_params method as before so that we only update the attributes we’re allowed to). non lo hai fatto nel create x prigrizia pero' nel tutorial lo spiega
		flash.notice = "Article '#{@article.title}' Updated!" #paragrafo Adding a Flash
		redirect_to article_path(@article)
		 #questo e' come se fai ridirezione al metodo show xke article_path e' associato a show
		 #Our example has articles#index, so requests will be sent to the index method of the 
		 # ArticlesController class. in questo caso article_patch invece manda la richieste al metodo show xke se guardi nella tabella article e' associato a show
	end
	#Implementing Update
	#The only new bit here is the update method. It’s very similar to Article.new where you can pass
	# in the hash of form data. It changes the values in the object to match the values submitted
	# with the form. One difference from new is that update automatically saves the changes


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


ADESSO PARTIAMO COL CAPITOLO I1
I1: Form-based Workflow

We’ve created sample articles from the console, but that isn’t a viable long-term solution. 
The users of our app will expect to add content through a web interface. In this iteration we’ll 
create an HTML form to submit the article, then all the backend processing to get it into the database.


=end