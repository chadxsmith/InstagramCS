class EntriesController < ApplicationController

  def index
    # index (displays all entries)
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
    # new (displays a form to create a new entry)
    # avaliable on the index page
  end


  def create #is a method  # create (saves a new entry it to the database)

      @entry = Entry.new(entry_params)

      if @entry.save
        redirect_to @entry

      else
        render :new
      end

  end


  def show
    @entries = Entry.all
    # show (displays a specific entry)
  end


  def edit
    @entry = Entry.find_by(params[:author])
    # edit (displays a form for editing a particular entry)
    #avaliabe on the  the show page

  end

  def update # is a method
    @entry = Entry.find_by(params[:author])
    @entry.update(entry_params)
    redirect_to @entry
    # update (takes input from the edit form and updates the entry in the db appropriately)

  end

  def destroy
    @entry = Entry.find_by(params[:author])
    @entry.destroy
    redirect_to entries_path
    # destroy (deletes a specific entry from the database)
    # avaliable on the show page
  end


  private #must be done to pass content with a create method

  def entry_params
            params.require(:entry).permit(:author, :photo_url, :date_taken)
  end

end
