class ConferencesController < ApplicationController
  # GET /conferences
  # GET /conferences.json
  def index
    session[:developer] = params[:developer] == 'true' if params[:developer]
    @conferences = Conference.all.sort_by! { |a| a.name }

    respond_to do |format|
      format.html do
        @posts = Post.all(limit: 50, order: 'created_at DESC')
        render 'index'
      end
      format.json { render json: @conferences }
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
    if params[:id].to_i > 0
      @conference = Conference.find(params[:id])
    else
      @conference = Conference.all.select { |c| c.url_code == params[:id].downcase.gsub(" ","") }.first
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/new
  # GET /conferences/new.json
  def new
    @conference = Conference.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conference }
    end
  end

  # GET /conferences/1/edit
  def edit
    @conference = Conference.find(params[:id])
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(params[:conference])

    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render json: @conference, status: :created, location: @conference }
      else
        format.html { render action: "new" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conferences/1
  # PUT /conferences/1.json
  def update
    @conference = Conference.find(params[:id])

    respond_to do |format|
      if @conference.update_attributes(params[:conference])
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy

    respond_to do |format|
      format.html { redirect_to conferences_url }
      format.json { head :no_content }
    end
  end

  # DELETE /conferences/1/attending
  def attending
    if is_logged_in
      if params[:attending] == 'true'
        Conference.find(params[:id]).users.push(current_user)
      else
        Conference.find(params[:id]).users.delete(current_user)
      end
    end
    redirect_to :back
  end
end
