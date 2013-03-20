class AttendsController < ApplicationController
  # GET /attends
  # GET /attends.json
  def index
    @attends = Attend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attends }
    end
  end

  # GET /attends/1
  # GET /attends/1.json
  def show
    @attend = Attend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attend }
    end
  end

  # GET /attends/new
  # GET /attends/new.json
  def new
    @attend = Attend.new
    #@membership = Membership.where("user_id = ? AND group_id = ?", @attend.user_id, @attend.group_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attend }
    end
  end

  # GET /attends/1/edit
  def edit
    @attend = Attend.find(params[:id])
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = Attend.new(params[:attend])
    

    #if membership.nil?
    #  format.html { redirect_to root_url, notice: 'Cant sign on to an event twice.' }
    #end
    respond_to do |format|
       member = Membership.find(:all, :conditions => ["group_id = ? and user_id = ?", @attend.group_id, @attend.user_id])
       if member.empty? || member.nil?
        #redirect_to root_url, notice: 'Need to be a member of the group'
        format.html { redirect_to root_url, notice: 'Need to be a member of the group sponsoring event before joining event.' }
        #format.html { render action: "new" }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
 
      if @attend.save
        format.html { redirect_to root_url, notice: 'Attend was successfully created.' }
        format.json { render json: @attend, status: :created, location: @attend }
      else
        format.html { redirect_to root_url, notice: 'Cant sign on to an event twice.' }
        #format.html { render action: "new" }
        format.json { render json: @attend.errors, status: :unprocessable_entity }

      end
    end
  end

  # PUT /attends/1
  # PUT /attends/1.json
  def update
    @attend = Attend.find(params[:id])

    respond_to do |format|
      if @attend.update_attributes(params[:attend])
        format.html { redirect_to @attend, notice: 'Attend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend = Attend.find(params[:id])
    @attend.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to attends_url }
      format.json { head :no_content }
    end
  end
end
