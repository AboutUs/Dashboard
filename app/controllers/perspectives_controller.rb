class PerspectivesController < ApplicationController
  # GET /perspectives
  # GET /perspectives.xml
  def index
    @perspectives = Perspective.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @perspectives }
    end
  end

  # GET /perspectives/1
  # GET /perspectives/1.xml
  def show
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.json { render :json => @perspective.data_points }
      format.xml  { render :xml => @perspective.data_points }
    end
  end

  # GET /perspectives/new
  # GET /perspectives/new.xml
  def new
    @perspective = Perspective.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @perspective }
    end
  end

  # GET /perspectives/1/edit
  def edit
    @perspective = Perspective.find(params[:id])
  end

  # POST /perspectives
  # POST /perspectives.xml
  def create
    @perspective = Perspective.new(params[:perspective])

    respond_to do |format|
      if @perspective.save
        format.html { redirect_to(@perspective, :notice => 'Perspective was successfully created.') }
        format.xml  { render :xml => @perspective, :status => :created, :location => @perspective }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @perspective.errors, :status => :unprocessable_entity }
      end
    end
  end

  def watch
    self.current_perspective = Perspective.find(params[:id])
    redirect_to '/'
  end

  # PUT /perspectives/1
  # PUT /perspectives/1.xml
  def update
    @perspective = Perspective.find(params[:id])

    respond_to do |format|
      if @perspective.update_attributes(params[:perspective])
        format.html { redirect_to(@perspective, :notice => 'Perspective was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @perspective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /perspectives/1
  # DELETE /perspectives/1.xml
  def destroy
    @perspective = Perspective.find(params[:id])
    @perspective.destroy

    respond_to do |format|
      format.html { redirect_to(perspectives_url) }
      format.xml  { head :ok }
    end
  end
end
