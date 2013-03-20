class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.json
  before_filter :current_user

  def current_user
    if session[:user_id]
    User.current_user = @current_user
  end
  end
  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.json
  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

def create
  @membership = Membership.new(params[:membership])
  #puts "current user is @current_user"
  #@membership = Membership.new(:userid => current_user,:groupid => params[:groupid])
  #@membership.current_user = @current_user #
  #@current_user = current_user
  #@membership = current_user.membership.build(:group_id => params[:group_id])
  if @membership.save
    flash[:notice] = "You have joined this group."
    redirect_to :back
  else
    flash[:notice] = "Unable to join - are you already a member of this group??"
    redirect_to :root
  end
end
  # POST /memberships
  # POST /memberships.json
  # def create
  #   @membership = Membership.new(params[:membership])

  #   respond_to do |format|
  #     if @membership.save
  #       format.html { redirect_to @membership, notice: 'Membership was successfully created.' }
  #       format.json { render json: @membership, status: :created, location: @membership }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @membership.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    
    @attends_to_destroy = Attend.where("user_id = ? AND group_id = ?", @membership.user_id, @membership.group_id)
    #@attends_to_destroy = #{Attend.where("user_id = ? AND group_id = ?", @membership.user_id, @membership.group_id)}
    
    #redirect_to :controller => 'attends', :action => 'delete', :id => @attends_to_destroy.id
    #attends_to_destroy.destroy_all
=begin
  membership = current_user.memberships.where(:id => params[:id]).first

  if membership.present?
     attends_to_destroy = membership.group.attends.where(:user_id => current_user.id)
     attends_to_destroy.destroy_all 
=end
    #@group = @groups.find {|group| group.id == @membership.group_id}
    #@user = @users.find {|user| user.id == @membership.user_id}
    #puts "user is @user"
    #@attends.each do |attend|
      #@attend = @attends.find {|attend| @user.id == @membership.user_id && @group_id == @membership.group_id}
    #@attend = Attend.where("user_id = ? AND group_id = ?", @membership.user_id, @membership.group_id)
    #Attend.destroy(#{@attend.id})
    
    #end


    respond_to do |format|
      #format.html { redirect_to memberships_url }
      format.js
      format.json { head :no_content }
    end
  end
end
