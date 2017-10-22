module ArticlesHelper

	def article_params #spiegato in Fragile Controllers
    	params.require(:article).permit(:title, :body)
  	end
end
