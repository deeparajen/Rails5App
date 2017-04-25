class ProductsController < ApplicationController
  def index
    @products = Product.order('created_at DESC')
    respond_to do |format|
      format.html
      ############# export to excel generation ########################
      format.xlsx do
        # template paramater used to specify the template from another controller, if same controller not required.
        render xlsx: 'index',:template => 'products/index', filename: "products_list.xlsx", disposition: 'inline',
      xlsx_created_at: 3.days.ago, xlsx_author: "Elmer Fudd"
      end
      
      #or
       
      # format.xlsx {
        # response.headers['Content-Disposition'] = 'attachment; filename="products_list.xlsx"'
      # }
      
      ########### conversion of html view template into pdf generation ####################
       format.pdf do
         render :pdf => "invoice",  # filename
         :template => "products/index.html.erb",  # template or file conversion of pdf
         :save_to_file =>  Rails.root.join('pdfs', "invoice.pdf"),  # save location
         :disposition => 'attachment'  # attachment(download) or inline( show in the browser window)
       end
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
