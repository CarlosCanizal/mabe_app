class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def get_total

    phone_id = params[:user][:phone_id]
    phone1 = params[:user][:phone1].to_i
    phone2 = params[:user][:phone2].to_i
    phone3 = params[:user][:phone3].to_i
    prices_user = User.prices[phone_id.to_i]
    price1 = User.prices[1]
    price2 = User.prices[2]
    price3 = User.prices[3]

    total = 0

    total += prices_user
    total += price1*phone1
    total += price2*phone2
    total += price3*phone3
    total
  end

  def thanks
  end
  

  # POST /users
  # POST /users.json
  def create

    total = get_total
    params[:user][:total] = total

    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/thanks'}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
      phone_id = params[:user][:phone_id]
      phone1 = params[:user][:phone1].to_i
      phone2 = params[:user][:phone2].to_i
      phone3 = params[:user][:phone3].to_i
      prices_user = User.prices[phone_id.to_i]
      price1 = User.prices[1]
      price2 = User.prices[2]
      price3 = User.prices[3]

      total = 0

      total += prices_user
      total += price1*phone1
      total += price2*phone2
      total += price3*phone3


  end


  # PUT /users/1
  # PUT /users/1.json
  def update

    total = get_total
    params[:user][:total] = total

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
