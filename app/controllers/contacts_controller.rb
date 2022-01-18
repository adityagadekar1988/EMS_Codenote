class ContactsController < ApplicationController
  def new
    @contact = Contact.new 
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to employees_path
    end 
  end 

  def edit
    @contact = Contact.find(params[:id])
  end 

  def update
    @contact = Contact.find(params[:id])
    if @contact.update
      flash[:notice] = "Contact was updated successfully" 
      redirect_to employees_path
    end 
  end

  def index
    @contacts = Contact.all
  end
end

def contact_params
  params.require(:contact).permit(:contact_type, :contact_number, :employee_id)
end